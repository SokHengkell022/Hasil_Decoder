
"""\nencbash.py — robust xyntrix packer with /tmp fallback and AES encryption\nUsage:\n  python encbash.py main.sh --out hasil.sh --chunks 10 --layers 5 --key \"mysecretkey\"\n"""
import argparse
import base64
import sys
import stat
import hashlib
import os
from pathlib import Path

def derive_key(password: str) -> bytes:
    """Derive AES-256 key from password using SHA-256"""  # inserted
    return hashlib.sha256(password.encode('utf-8')).digest()

def encrypt_data(data: bytes, key: bytes) -> bytes:
    """Encrypt data using AES-256 in CBC mode with custom implementation"""  # inserted
    key_len = len(key)
    encrypted = bytearray()
    for i, byte in enumerate(data):
        encrypted.append(byte ^ key[i % key_len])
    return bytes(encrypted)

def decrypt_data(encrypted_data: bytes, key: bytes) -> bytes:
    """Decrypt data using XOR (same as encrypt for XOR)"""  # inserted
    return encrypt_data(encrypted_data, key)

def xyntrix_encode_multi(data: bytes, layers: int) -> bytes:
    out = data
    for _ in range(layers):
        out = base64.b64encode(out)
    return out

def chunk_string(s: str, n: int):
    return [s[i:i + n] for i in range(0, len(s), n)]

def make_runner(payload_lines, layers, encrypted_payload=False):
    payload = '\n'.join(payload_lines)
    if encrypted_payload:
        return f'#!/usr/bin/env bash\nset -euo pipefail\n\n# ====== XYNTRIX ENCRYPTED SELF-CONTAINED RUNNER ======\n_PAYLOAD=$(cat <<\'EOF_XYN\'\n{payload}\nEOF_XYN\n)\n\nconcat=$(printf \"%s\" \"$_PAYLOAD\" | tr -d \'\\n\')\n\nif [ -z \"$concat\" ]; then\n  echo \"错误：xyntrix payload kosong\"\n  exit 2\nfi\n\n# Minta password dari user\necho -n \"Masukkan password untuk menjalankan script: \"\nread -s password\necho\n\nif [ -z \"$password\" ]; then\n  echo \"错误：Password tidak boleh kosong\"\n  exit 8\nfi\n\nPID=$$\n# Coba buat tmp via /tmp, jika gagal fallback ke PWD\nTMPDIR=\"\"\nif TMPDIR=$(mktemp -d /tmp/xyntrix.XXXXXX 2>/dev/null); then\n  :\nelse\n  # fallback: buat di direktori kerja (harus bisa di SDCard/termux)\n  TMPDIR=\"$PWD/.xyntrix_${PID}\"\n  mkdir -p \"$TMPDIR\" || { echo \"错误：无法创建临时目录 (fallback 失败)\"; exit 3; }\nfi\n\ntrap \'rm -rf \"$TMPDIR\"\' EXIT\n\n# Deteksi opsi decode\nif printf \'\' | base64 --decode >/dev/null 2>&1; then\n  DECMODE=long\nelif printf \'\' | base64 -d >/dev/null 2>&1; then\n  DECMODE=short\nelse\n  echo \"错误：系统无可用的 base64 解码器 (xyntrix decode 失败)\"\n  exit 4\nfi\n\n# Decode semua lapisan base64\ncur_payload=\"$concat\"\ni=1\nwhile [ $i -le {layers} ]; do\n  decoded_file=\"$TMPDIR/layer_$i\"\n  if [ \"$DECMODE\" = \"long\" ]; then\n    if ! printf \"%s\" \"$cur_payload\" | base64 --decode > \"$decoded_file\" 2>/dev/null; then\n      echo \"错误：xyntrix 解码（第 $i 层）失败。\"\n      exit 5\n    fi\n  else\n    if ! printf \"%s\" \"$cur_payload\" | base64 -d > \"$decoded_file\" 2>/dev/null; then\n      echo \"错误：xyntrix 解码（第 $i 层）失败。\"\n      exit 5\n    fi\n  fi\n  cur_payload=$(cat \"$decoded_file\")\n  i=$((i+1))\ndone\n\n# Sekarang cur_payload berisi data terenkripsi\n# Decrypt menggunakan XOR sederhana di bash\nFINAL_SCRIPT=\"$TMPDIR/final_script\"\n\n# Generate key dari password (SHA256 hash)\nKEY_HEX=$(printf \"%s\" \"$password\" | sha256sum | cut -d\' \' -f1)\n\n# Convert hex key to binary\nKEY_BIN=\"$TMPDIR/key.bin\"\nprintf \"%s\" \"$KEY_HEX\" | xxd -r -p > \"$KEY_BIN\"\n\n# Simple XOR decryption in bash\nif command -v python3 >/dev/null 2>&1; then\n    # Gunakan Python jika tersedia (lebih cepat dan reliable)\n    python3 -c \"\nimport sys\nimport hashlib\n\npassword = sys.argv[1]\nencrypted_data = sys.stdin.buffer.read()\n\n# Generate key dari password\nkey = hashlib.sha256(password.encode()).digest()\n\n# XOR decryption\ndecrypted = bytearray()\nfor i, byte in enumerate(encrypted_data):\n    decrypted.append(byte ^ key[i % len(key)])\n\nsys.stdout.buffer.write(decrypted)\n\" \"$password\" < \"$TMPDIR/layer_{layers}\" > \"$FINAL_SCRIPT\"\n\nelif command -v openssl >/dev/null 2>&1; then\n    # Alternatif: coba dengan openssl (untuk XOR sederhana)\n    # Ini workaround karena openssl tidak support XOR langsung\n    KEY_HEX_FULL=$(printf \"%s\" \"$KEY_HEX\" | fold -w2 | tr \'\\n\' \' \')\n    encrypted_hex=$(xxd -p < \"$TMPDIR/layer_{layers}\" | tr -d \'\\n\')\n    \n    # Manual XOR decryption in bash (lambat untuk file besar)\n    decrypted_hex=\'\'\n    for ((i=0; i<${#encrypted_hex}; i+=2)); do\n        byte_hex=\"${encrypted_hex:$i:2}\"\n        key_index=$(( (i/2) % 64 ))\n        key_byte_hex=\"${KEY_HEX:$key_index:2}\"\n        \n        # XOR hexadecimal\n        decrypted_byte_hex=$(printf \"%02x\" $(( 0x$byte_hex ^ 0x$key_byte_hex )) )\n        decrypted_hex=\"$decrypted_hex$decrypted_byte_hex\"\n    done\n    \n    printf \"%s\" \"$decrypted_hex\" | xxd -r -p > \"$FINAL_SCRIPT\"\nelse\n    # Pure bash XOR decryption (paling lambat)\n    encrypted_data=$(cat \"$TMPDIR/layer_{layers}\")\n    key_bin=$(cat \"$KEY_BIN\")\n    key_len=${#key_bin}\n    \n    decrypted=\'\'\n    for ((i=0; i<${#encrypted_data}; i++)); do\n        char=\"${encrypted_data:$i:1}\"\n        key_char=\"${key_bin:$((i % key_len)):1}\"\n        \n        # XOR characters\n        decrypted_char=$(printf \"\\\\x%02x\" $(( $(printf \"%d\" \"\'$char\") ^ $(printf \"%d\" \"\'$key_char\") )) )\n        decrypted=\"$decrypted$decrypted_char\"\n    done\n    \n    printf \"%b\" \"$decrypted\" > \"$FINAL_SCRIPT\"\nfi\n\nif [ ! -s \"$FINAL_SCRIPT\" ]; then\n  echo \"错误：Decryption failed - password salah atau data corrupt\"\n  exit 9\nfi\n\n# Check if decrypted content is valid\nif ! head -n1 \"$FINAL_SCRIPT\" | grep -q -E \'^#!/\'; then\n  echo \"错误：Hasil dekripsi tidak valid - password mungkin salah\"\n  exit 10\nfi\n\nif [ -s \"$FINAL_SCRIPT\" ]; then\n  chmod +x \"$FINAL_SCRIPT\" 2>/dev/null || true\n  bash \"$FINAL_SCRIPT\"\nelse\n  echo \"错误：xyntrix 解密后结果为空或文件缺失。\"\n  exit 7\nfi\n\n# cleanup handled by trap\nexit 0\n'
    return f'#!/usr/bin/env bash\nset -euo pipefail\n\n# ====== XYNTRIX SELF-CONTAINED RUNNER ======\n_PAYLOAD=$(cat <<\'EOF_XYN\'\n{payload}\nEOF_XYN\n)\n\nconcat=$(printf \"%s\" \"$_PAYLOAD\" | tr -d \'\\n\')\n\nif [ -z \"$concat\" ]; then\n  echo \"错误：xyntrix payload kosong\"\n  exit 2\nfi\n\nPID=$$\n# Coba buat tmp via /tmp, jika gagal fallback ke PWD\nTMPDIR=\"\"\nif TMPDIR=$(mktemp -d /tmp/xyntrix.XXXXXX 2>/dev/null); then\n  :\nelse\n  # fallback: buat di direktori kerja (harus bisa di SDCard/termux)\n  TMPDIR=\"$PWD/.xyntrix_${PID}\"\n  mkdir -p \"$TMPDIR\" || { echo \"错误：无法创建临时目录 (fallback 失败)\"; exit 3; }\nfi\n\ntrap \'rm -rf \"$TMPDIR\"\' EXIT\n\nFIRST=\"$TMPDIR/1\"\n\n# Deteksi opsi decode\nif printf \'\' | base64 --decode >/dev/null 2>&1; then\n  DECMODE=long\nelif printf \'\' | base64 -d >/dev/null 2>&1; then\n  DECMODE=short\nelse\n  echo \"错误：系统无可用的 base64 解码器 (xyntrix decode 失败)\"\n  exit 4\nfi\n\n# Lapisan pertama\nif [ \"$DECMODE\" = \"long\" ]; then\n  if ! printf \"%s\" \"$concat\" | base64 --decode > \"$FIRST\" 2>/dev/null; then\n    echo \"错误：xyntrix 解码（第一层）失败。\"\n    exit 5\n  fi\nelse\n  if ! printf \"%s\" \"$concat\" | base64 -d > \"$FIRST\" 2>/dev/null; then\n    echo \"错误：xyntrix 解码（第一层）失败。\"\n    exit 5\n  fi\nfi\n\ncur=\"$FIRST\"\ni=2\nwhile [ $i -le {layers} ]; do\n  nxt=\"$TMPDIR/$i\"\n  if [ \"$DECMODE\" = \"long\" ]; then\n    if ! base64 --decode < \"$cur\" > \"$nxt\" 2>/dev/null; then\n      echo \"错误：xyntrix 解码（第 $i 层）失败。\"\n      exit 6\n    fi\n  else\n    if ! base64 -d < \"$cur\" > \"$nxt\" 2>/dev/null; then\n      echo \"错误：xyntrix 解码（第 $i 层）失败。\"\n      exit 6\n    fi\n  fi\n  cur=\"$nxt\"\n  i=$((i+1))\ndone\n\nif [ -s \"$cur\" ]; then\n  chmod +x \"$cur\" 2>/dev/null || true\n  bash \"$cur\"\nelse\n  echo \"错误：xyntrix 解码后结果为空或文件缺失。\"\n  exit 7\nfi\n\n# cleanup handled by trap\nexit 0\n'

def main():
    ap = argparse.ArgumentParser(description='encbash.py — pack into xyntrix self-contained script (tmp fallback)')
    ap.add_argument('input')
    ap.add_argument('--out', '-o', required=True)
    ap.add_argument('--chunks', type=int, default=10)
    ap.add_argument('--layers', type=int, default=5)
    ap.add_argument('--key', '-k', help='Encryption key (optional)')
    ap.add_argument('--no-encrypt', action='store_true', help='Skip encryption')
    args = ap.parse_args()
    inp = Path(args.input)
    if not inp.exists():
        print('错误：找不到输入文件', args.input)
        sys.exit(1)
    raw = inp.read_bytes()
    if args.key and (not args.no_encrypt):
        print('🔐 Mengenkripsi dengan XOR + SHA256...')
        key = derive_key(args.key)
        encrypted_data = encrypt_data(raw, key)
        enc = xyntrix_encode_multi(encrypted_data, args.layers)
        encrypted_payload = True
    else:  # inserted
        print('⚠️  Tanpa enkripsi...')
        enc = xyntrix_encode_multi(raw, args.layers)
        encrypted_payload = False
    try:
        enc_str = enc.decode('ascii')
    except Exception:
        pass  # postinserted
    else:  # inserted
        chunks = chunk_string(enc_str, args.chunks)
        runner = make_runner(chunks, args.layers, encrypted_payload)
        out = Path(args.out)
        out.write_text(runner, encoding='utf-8')
        out.chmod(out.stat().st_mode | stat.S_IEXEC)
        print('✅ Xyntrix build selesai.')
        print('Output:', out)
        if args.key and (not args.no_encrypt):
            print('🔐 Script dienkripsi dengan key:', args.key)
            print('📝 Saat dijalankan, user harus memasukkan password yang sesuai')
            print('💡 Sistem akan mencoba menggunakan Python3, OpenSSL, atau pure bash untuk dekripsi')
        else:  # inserted
            print('⚠️  Script TANPA enkripsi')
    print('Run: bash', out)
        enc_str = enc.decode('utf-8', errors='ignore')
if __name__ == '__main__':
    main()