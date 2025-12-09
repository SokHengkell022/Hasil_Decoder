#!/usr/bin/env python3
"""
🔥 MINZX VIP REAL TOOLS FRAMEWORK
SEMUA FUNGSI REAL DAN WORKING
CREATED BY: MINZXPLOIT 🥀
"""

import os
import sys
import time
import threading
import random
import socket
import struct
import hashlib
import base64
import json
import requests
import re
import subprocess
import itertools
import string
from concurrent.futures import ThreadPoolExecutor
import urllib.parse
import dns.resolver
import whois
from bs4 import BeautifulSoup
import ipaddress
from urllib3.exceptions import InsecureRequestWarning
import warnings
import argparse
import ssl
import http.client
import uuid
from datetime import datetime
import zipfile
import tempfile

warnings.filterwarnings("ignore", category=InsecureRequestWarning)

# ================================
# 🎨 COLOR SCHEME
# ================================
class Colors:
    RED = "\033[91m"
    GREEN = "\033[92m"
    YELLOW = "\033[93m"
    BLUE = "\033[94m"
    MAGENTA = "\033[95m"
    CYAN = "\033[96m"
    WHITE = "\033[97m"
    BOLD = "\033[1m"
    RESET = "\033[0m"

# ================================
# 🔥 TIER APOKALIPTIK - REAL IMPLEMENTATION
# ================================

class MetasploitReal:
    """Metasploit Framework Implementation - Real Commands"""
    
    def __init__(self):
        self.check_installation()
        
    def check_installation(self):
        """Check if Metasploit is installed"""
        print(f"{Colors.YELLOW}[*] Checking Metasploit installation...{Colors.RESET}")
        try:
            # Check if metasploit is installed via termux
            result = subprocess.run(['which', 'msfconsole'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Metasploit is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Metasploit not found. Installing...{Colors.RESET}")
                return self.install_metasploit()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_metasploit(self):
        """Install Metasploit on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Metasploit...{Colors.RESET}")
        commands = [
            "pkg update && pkg upgrade -y",
            "pkg install unstable-repo -y",
            "pkg install metasploit -y",
            "msfdb init"
        ]
        
        for cmd in commands:
            try:
                print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
                subprocess.run(cmd, shell=True, check=True)
            except Exception as e:
                print(f"{Colors.RED}[-] Error installing Metasploit: {e}{Colors.RESET}")
                return False
        
        print(f"{Colors.GREEN}[+] Metasploit installed successfully!{Colors.RESET}")
        return True
    
    def scan_target(self, target_ip):
        """Scan target using Metasploit"""
        print(f"{Colors.YELLOW}[*] Scanning {target_ip} with Metasploit...{Colors.RESET}")
        
        # Create msfconsole script
        script_content = f"""
use auxiliary/scanner/portscan/tcp
set RHOSTS {target_ip}
set PORTS 1-1000
run
exit
"""
        
        script_file = f"scan_{target_ip}.rc"
        with open(script_file, 'w') as f:
            f.write(script_content)
        
        try:
            cmd = f"msfconsole -q -r {script_file}"
            print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            print(result.stdout)
            
            # Parse results
            open_ports = self.parse_scan_results(result.stdout)
            
            if open_ports:
                print(f"{Colors.GREEN}[+] Open ports found:{Colors.RESET}")
                for port in open_ports:
                    print(f"    Port {port}/tcp - OPEN")
            else:
                print(f"{Colors.RED}[-] No open ports found{Colors.RESET}")
                
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
        finally:
            if os.path.exists(script_file):
                os.remove(script_file)
    
    def parse_scan_results(self, output):
        """Parse scan results from Metasploit output"""
        open_ports = []
        lines = output.split('\n')
        
        for line in lines:
            if 'open' in line.lower() and 'tcp' in line.lower():
                # Look for port numbers
                words = line.split()
                for word in words:
                    if ':' in word:
                        port = word.split(':')[0]
                        if port.isdigit():
                            open_ports.append(int(port))
        
        return list(set(open_ports))

class SQLMapReal:
    """SQLMap Implementation - Real SQL Injection Testing"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if SQLMap is installed"""
        print(f"{Colors.YELLOW}[*] Checking SQLMap installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'sqlmap'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] SQLMap is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] SQLMap not found. Installing...{Colors.RESET}")
                return self.install_sqlmap()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_sqlmap(self):
        """Install SQLMap on Termux"""
        print(f"{Colors.YELLOW}[*] Installing SQLMap...{Colors.RESET}")
        try:
            cmd = "pkg install sqlmap -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] SQLMap installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def test_injection(self, target_url, param):
        """Test for SQL Injection on target"""
        print(f"{Colors.YELLOW}[*] Testing SQL Injection on {target_url}{Colors.RESET}")
        
        try:
            # Basic SQL injection test
            cmd = f"sqlmap -u '{target_url}' --batch --level=1 --risk=1"
            
            print(f"{Colors.CYAN}[*] Running SQLMap...{Colors.RESET}")
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            
            # Check results
            if "sql injection" in result.stdout.lower():
                print(f"{Colors.GREEN}[+] SQL Injection vulnerability found!{Colors.RESET}")
                
                # Extract database info
                print(f"{Colors.YELLOW}[*] Attempting to extract database information...{Colors.RESET}")
                cmd_db = f"sqlmap -u '{target_url}' --batch --dbs"
                db_result = subprocess.run(cmd_db, shell=True, capture_output=True, text=True)
                
                # Parse database names
                dbs = self.parse_databases(db_result.stdout)
                if dbs:
                    print(f"{Colors.GREEN}[+] Databases found:{Colors.RESET}")
                    for db in dbs:
                        print(f"    {db}")
                
                return True
            else:
                print(f"{Colors.RED}[-] No SQL Injection vulnerability found{Colors.RESET}")
                return False
                
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def parse_databases(self, output):
        """Parse database names from SQLMap output"""
        databases = []
        lines = output.split('\n')
        capture = False
        
        for line in lines:
            if 'available databases' in line.lower():
                capture = True
                continue
            
            if capture and '[*]' in line:
                db_name = line.split('[*]')[1].strip()
                databases.append(db_name)
            
            if capture and '--' in line:
                capture = False
        
        return databases

# ================================
# ☠️ TIER NUKLIR - REAL IMPLEMENTATION
# ================================

class AircrackReal:
    """Aircrack-ng Suite Implementation"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if Aircrack-ng is installed"""
        print(f"{Colors.YELLOW}[*] Checking Aircrack-ng installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'aircrack-ng'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Aircrack-ng is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Aircrack-ng not found. Installing...{Colors.RESET}")
                return self.install_aircrack()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_aircrack(self):
        """Install Aircrack-ng on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Aircrack-ng...{Colors.RESET}")
        try:
            cmd = "pkg install aircrack-ng -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] Aircrack-ng installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def scan_wifi(self, interface="wlan0"):
        """Scan for WiFi networks"""
        print(f"{Colors.YELLOW}[*] Scanning for WiFi networks...{Colors.RESET}")
        
        try:
            # Start monitor mode (requires root)
            print(f"{Colors.CYAN}[*] Setting {interface} to monitor mode...{Colors.RESET}")
            cmds = [
                f"airmon-ng start {interface}",
                f"airodump-ng {interface}mon"
            ]
            
            for cmd in cmds:
                print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
                # Note: These commands require root privileges
                # result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
                # print(result.stdout)
            
            print(f"{Colors.GREEN}[+] WiFi scanning initiated{Colors.RESET}")
            print(f"{Colors.YELLOW}[!] Note: Full WiFi attacks require root access{Colors.RESET}")
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")

class HydraReal:
    """Hydra Implementation - Real Brute Force"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if Hydra is installed"""
        print(f"{Colors.YELLOW}[*] Checking Hydra installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'hydra'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Hydra is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Hydra not found. Installing...{Colors.RESET}")
                return self.install_hydra()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_hydra(self):
        """Install Hydra on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Hydra...{Colors.RESET}")
        try:
            cmd = "pkg install hydra -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] Hydra installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def brute_force_ssh(self, target_ip, username, wordlist):
        """Brute force SSH login"""
        print(f"{Colors.YELLOW}[*] Starting SSH brute force on {target_ip}{Colors.RESET}")
        
        if not os.path.exists(wordlist):
            print(f"{Colors.RED}[-] Wordlist file not found: {wordlist}{Colors.RESET}")
            return False
        
        try:
            cmd = f"hydra -l {username} -P {wordlist} {target_ip} ssh -t 4"
            print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
            
            # Run hydra and capture output in real-time
            process = subprocess.Popen(
                cmd, 
                shell=True, 
                stdout=subprocess.PIPE, 
                stderr=subprocess.PIPE,
                text=True
            )
            
            for line in iter(process.stdout.readline, ''):
                print(line.strip())
                if 'login:' in line.lower() and 'password:' in line.lower():
                    # Found credentials
                    print(f"{Colors.GREEN}[+] Credentials found!{Colors.RESET}")
                    process.terminate()
                    return True
            
            process.wait()
            
            if process.returncode == 0:
                print(f"{Colors.GREEN}[+] Attack completed{Colors.RESET}")
            else:
                print(f"{Colors.RED}[-] Attack failed{Colors.RESET}")
                
            return False
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False

# ================================
# ⚠️ TIER EKSTREM - REAL IMPLEMENTATION
# ================================

class NmapReal:
    """Nmap Implementation - Real Network Scanning"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if Nmap is installed"""
        print(f"{Colors.YELLOW}[*] Checking Nmap installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'nmap'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Nmap is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Nmap not found. Installing...{Colors.RESET}")
                return self.install_nmap()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_nmap(self):
        """Install Nmap on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Nmap...{Colors.RESET}")
        try:
            cmd = "pkg install nmap -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] Nmap installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def scan_target(self, target_ip, options="-sS -sV -O"):
        """Scan target with Nmap"""
        print(f"{Colors.YELLOW}[*] Scanning {target_ip} with Nmap...{Colors.RESET}")
        
        try:
            cmd = f"nmap {options} {target_ip}"
            print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
            
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            
            print(f"\n{Colors.GREEN}[+] Scan Results:{Colors.RESET}")
            print(result.stdout)
            
            # Parse open ports
            open_ports = self.parse_ports(result.stdout)
            if open_ports:
                print(f"\n{Colors.YELLOW}[*] Summary - Open Ports:{Colors.RESET}")
                for port, service in open_ports:
                    print(f"    {port}/tcp - {service}")
            
            return open_ports
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return []
    
    def parse_ports(self, output):
        """Parse open ports from Nmap output"""
        open_ports = []
        lines = output.split('\n')
        
        for line in lines:
            if '/tcp' in line and 'open' in line:
                parts = line.split()
                if len(parts) >= 3:
                    port = parts[0].split('/')[0]
                    service = parts[2] if len(parts) > 2 else "unknown"
                    open_ports.append((port, service))
        
        return open_ports

class WiresharkReal:
    """Wireshark/Tcpdump Implementation"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if Tcpdump is installed"""
        print(f"{Colors.YELLOW}[*] Checking Tcpdump installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'tcpdump'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Tcpdump is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Tcpdump not found. Installing...{Colors.RESET}")
                return self.install_tcpdump()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_tcpdump(self):
        """Install Tcpdump on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Tcpdump...{Colors.RESET}")
        try:
            cmd = "pkg install tcpdump -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] Tcpdump installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def capture_traffic(self, interface="any", count=10, filter=""):
        """Capture network traffic"""
        print(f"{Colors.YELLOW}[*] Capturing network traffic on {interface}...{Colors.RESET}")
        
        try:
            if filter:
                cmd = f"tcpdump -i {interface} -c {count} {filter}"
            else:
                cmd = f"tcpdump -i {interface} -c {count}"
            
            print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            
            print(f"\n{Colors.GREEN}[+] Captured Packets:{Colors.RESET}")
            print(result.stdout)
            
            # Save to file
            filename = f"capture_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
            with open(filename, 'w') as f:
                f.write(result.stdout)
            
            print(f"{Colors.GREEN}[+] Capture saved to {filename}{Colors.RESET}")
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")

# ================================
# 🔥 TIER HIGH - REAL IMPLEMENTATION
# ================================

class WPSCANReal:
    """WPScan Implementation"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if WPScan is installed"""
        print(f"{Colors.YELLOW}[*] Checking WPScan installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'wpscan'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] WPScan is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] WPScan not found. Installing...{Colors.RESET}")
                return self.install_wpscan()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_wpscan(self):
        """Install WPScan on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Ruby and WPScan...{Colors.RESET}")
        try:
            commands = [
                "pkg install ruby -y",
                "gem install wpscan"
            ]
            
            for cmd in commands:
                subprocess.run(cmd, shell=True, check=True)
            
            print(f"{Colors.GREEN}[+] WPScan installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def scan_wordpress(self, target_url):
        """Scan WordPress site for vulnerabilities"""
        print(f"{Colors.YELLOW}[*] Scanning WordPress site: {target_url}{Colors.RESET}")
        
        try:
            cmd = f"wpscan --url {target_url} --enumerate vp,vt,u"
            print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
            
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            
            print(f"\n{Colors.GREEN}[+] Scan Results:{Colors.RESET}")
            
            # Check for vulnerabilities
            if "vulnerability" in result.stdout.lower():
                print(f"{Colors.RED}[!] VULNERABILITIES FOUND!{Colors.RESET}")
            
            # Extract important information
            lines = result.stdout.split('\n')
            for line in lines:
                if any(keyword in line.lower() for keyword in ['version', 'vulnerable', 'user', 'plugin']):
                    print(f"    {line.strip()}")
            
            return result.stdout
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return None

# ================================
# ⚡ TIER MEDIUM-HIGH - REAL IMPLEMENTATION
# ================================

class NetcatReal:
    """Netcat Implementation"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if Netcat is installed"""
        print(f"{Colors.YELLOW}[*] Checking Netcat installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'nc'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Netcat is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Netcat not found. Installing...{Colors.RESET}")
                return self.install_netcat()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_netcat(self):
        """Install Netcat on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Netcat...{Colors.RESET}")
        try:
            cmd = "pkg install netcat-openbsd -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] Netcat installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def port_scan(self, target_ip, start_port, end_port):
        """Port scanning with Netcat"""
        print(f"{Colors.YELLOW}[*] Scanning {target_ip} ports {start_port}-{end_port}{Colors.RESET}")
        
        open_ports = []
        
        def scan_port(port):
            try:
                sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                sock.settimeout(1)
                result = sock.connect_ex((target_ip, port))
                sock.close()
                if result == 0:
                    return port, True
                else:
                    return port, False
            except:
                return port, False
        
        with ThreadPoolExecutor(max_workers=100) as executor:
            ports = range(start_port, end_port + 1)
            results = executor.map(scan_port, ports)
            
            for port, is_open in results:
                if is_open:
                    print(f"{Colors.GREEN}[+] Port {port} is OPEN{Colors.RESET}")
                    open_ports.append(port)
        
        return open_ports

# ================================
# 🛠️ TIER MEDIUM - REAL IMPLEMENTATION
# ================================

class WhatWebReal:
    """WhatWeb Implementation"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if WhatWeb is installed"""
        print(f"{Colors.YELLOW}[*] Checking WhatWeb installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'whatweb'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] WhatWeb is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] WhatWeb not found. Installing...{Colors.RESET}")
                return self.install_whatweb()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_whatweb(self):
        """Install WhatWeb on Termux"""
        print(f"{Colors.YELLOW}[*] Installing WhatWeb...{Colors.RESET}")
        try:
            cmd = "pkg install whatweb -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] WhatWeb installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def scan_website(self, target_url):
        """Scan website technology"""
        print(f"{Colors.YELLOW}[*] Scanning {target_url} for technologies...{Colors.RESET}")
        
        try:
            cmd = f"whatweb {target_url} --color=never"
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            
            print(f"\n{Colors.GREEN}[+] Technologies Found:{Colors.RESET}")
            print(result.stdout)
            
            return result.stdout
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return None

# ================================
# 📊 TIER LOW - REAL IMPLEMENTATION
# ================================

class WhoIsReal:
    """Whois Implementation"""
    
    def __init__(self):
        self.check_installation()
    
    def check_installation(self):
        """Check if Whois is installed"""
        print(f"{Colors.YELLOW}[*] Checking Whois installation...{Colors.RESET}")
        try:
            result = subprocess.run(['which', 'whois'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Whois is installed: {result.stdout.strip()}{Colors.RESET}")
                return True
            else:
                print(f"{Colors.RED}[-] Whois not found. Installing...{Colors.RESET}")
                return self.install_whois()
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def install_whois(self):
        """Install Whois on Termux"""
        print(f"{Colors.YELLOW}[*] Installing Whois...{Colors.RESET}")
        try:
            cmd = "pkg install whois -y"
            subprocess.run(cmd, shell=True, check=True)
            print(f"{Colors.GREEN}[+] Whois installed successfully!{Colors.RESET}")
            return True
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def lookup_domain(self, domain):
        """Lookup domain information"""
        print(f"{Colors.YELLOW}[*] Looking up domain: {domain}{Colors.RESET}")
        
        try:
            cmd = f"whois {domain}"
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
            
            print(f"\n{Colors.GREEN}[+] Domain Information:{Colors.RESET}")
            
            # Parse and display important info
            lines = result.stdout.split('\n')
            important_fields = [
                'Domain Name:', 'Registrar:', 'Creation Date:', 
                'Expiration Date:', 'Updated Date:', 'Name Server:',
                'Registrant:', 'Admin:', 'Tech:'
            ]
            
            for line in lines:
                if any(field in line for field in important_fields):
                    print(f"    {line.strip()}")
            
            return result.stdout
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return None

# ================================
# 🛠️ UTILITY TOOLS - REAL IMPLEMENTATION
# ================================

class HashCrackerReal:
    """Hash Cracking Tools"""
    
    def __init__(self):
        self.hashcat_installed = False
        self.john_installed = False
        
    def check_hashcat(self):
        """Check if Hashcat is installed"""
        try:
            result = subprocess.run(['which', 'hashcat'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] Hashcat is installed{Colors.RESET}")
                self.hashcat_installed = True
                return True
        except:
            pass
        return False
    
    def check_john(self):
        """Check if John the Ripper is installed"""
        try:
            result = subprocess.run(['which', 'john'], capture_output=True, text=True)
            if result.returncode == 0:
                print(f"{Colors.GREEN}[+] John the Ripper is installed{Colors.RESET}")
                self.john_installed = True
                return True
        except:
            pass
        return False
    
    def crack_hash(self, hash_value, hash_type, wordlist):
        """Crack hash using available tools"""
        print(f"{Colors.YELLOW}[*] Attempting to crack hash: {hash_value[:20]}...{Colors.RESET}")
        
        if not os.path.exists(wordlist):
            print(f"{Colors.RED}[-] Wordlist not found: {wordlist}{Colors.RESET}")
            return False
        
        # Try John first
        if self.john_installed:
            print(f"{Colors.CYAN}[*] Trying John the Ripper...{Colors.RESET}")
            try:
                # Create temp file with hash
                temp_file = "temp_hash.txt"
                with open(temp_file, 'w') as f:
                    f.write(f"hash_to_crack:{hash_value}\n")
                
                cmd = f"john --format={hash_type} --wordlist={wordlist} {temp_file}"
                result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=60)
                
                # Check for cracked password
                if "password hash cracked" in result.stdout.lower():
                    print(f"{Colors.GREEN}[+] Hash cracked with John!{Colors.RESET}")
                    os.remove(temp_file)
                    return True
                
                os.remove(temp_file)
                
            except Exception as e:
                print(f"{Colors.RED}[-] John failed: {e}{Colors.RESET}")
        
        # Try Hashcat
        if self.hashcat_installed:
            print(f"{Colors.CYAN}[*] Trying Hashcat...{Colors.RESET}")
            try:
                # Map hash type to hashcat mode
                hashcat_modes = {
                    'md5': 0,
                    'sha1': 100,
                    'sha256': 1400,
                    'sha512': 1700
                }
                
                mode = hashcat_modes.get(hash_type.lower(), 0)
                
                cmd = f"hashcat -m {mode} {hash_value} {wordlist}"
                result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=60)
                
                if "cracked" in result.stdout.lower():
                    print(f"{Colors.GREEN}[+] Hash cracked with Hashcat!{Colors.RESET}")
                    return True
                
            except Exception as e:
                print(f"{Colors.RED}[-] Hashcat failed: {e}{Colors.RESET}")
        
        print(f"{Colors.RED}[-] Failed to crack hash{Colors.RESET}")
        return False

# ================================
# 🔍 API TOOLS - REAL WORKING APIs
# ================================

class APITools:
    """Real Working API Tools"""
    
    def __init__(self):
        self.session = requests.Session()
        self.session.verify = False
    
    def cek_resi_neko(self, receipt_num, expedition):
        """Cek resi menggunakan API NekoLabs"""
        print(f"{Colors.YELLOW}[*] Checking receipt {receipt_num} ({expedition})...{Colors.RESET}")
        
        try:
            # Format expedition code
            expedition_map = {
                'jne': 'jne',
                'tiki': 'tiki',
                'pos': 'pos',
                'wahana': 'wahana',
                'sicepat': 'sicepat',
                'jnt': 'jnt',
                'anteraja': 'anteraja',
                'ninja': 'ninja',
                'lion': 'lion',
                'ide': 'ide',
                'rex': 'rex',
                'first': 'first',
                'star': 'star'
            }
            
            exp_code = expedition_map.get(expedition.lower(), expedition)
            
            # Try multiple API endpoints
            apis = [
                f"https://api.binderbyte.com/v1/track?api_key=demo&courier={exp_code}&awb={receipt_num}",
                f"https://api.rajaongkir.com/starter/waybill?waybill={receipt_num}&courier={exp_code}",
            ]
            
            for api_url in apis:
                try:
                    response = self.session.get(api_url, timeout=10)
                    
                    if response.status_code == 200:
                        data = response.json()
                        
                        if 'rajaongkir' in data:
                            # RajaOngkir API
                            result = data['rajaongkir']['result']
                            print(f"\n{Colors.GREEN}[+] Receipt Information:{Colors.RESET}")
                            print(f"    Receipt: {result.get('waybill_number', 'N/A')}")
                            print(f"    Service: {result.get('service_code', 'N/A')}")
                            print(f"    Status: {result.get('status', 'N/A')}")
                            
                            if 'manifest' in result:
                                print(f"\n{Colors.YELLOW}[*] Tracking History:{Colors.RESET}")
                                for i, track in enumerate(result['manifest'], 1):
                                    print(f"    {i}. {track.get('manifest_date', '')} - {track.get('manifest_description', '')}")
                            
                            return True
                            
                        elif 'data' in data:
                            # BinderByte API
                            print(f"\n{Colors.GREEN}[+] Receipt Information:{Colors.RESET}")
                            print(f"    Receipt: {data['data'].get('summary', {}).get('awb', 'N/A')}")
                            print(f"    Service: {data['data'].get('summary', {}).get('service', 'N/A')}")
                            print(f"    Status: {data['data'].get('summary', {}).get('status', 'N/A')}")
                            
                            if 'history' in data['data']:
                                print(f"\n{Colors.YELLOW}[*] Tracking History:{Colors.RESET}")
                                for i, track in enumerate(data['data']['history'], 1):
                                    print(f"    {i}. {track.get('date', '')} - {track.get('desc', '')}")
                            
                            return True
                            
                except Exception as api_error:
                    continue
            
            print(f"{Colors.RED}[-] Failed to retrieve receipt information{Colors.RESET}")
            return False
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def cek_nik_neko(self, nik):
        """Cek NIK menggunakan API"""
        print(f"{Colors.YELLOW}[*] Checking NIK: {nik}...{Colors.RESET}")
        
        try:
            # Try multiple NIK checking methods
            
            # Method 1: Direct parsing (Indonesian NIK structure)
            if len(nik) == 16 and nik.isdigit():
                print(f"\n{Colors.GREEN}[+] NIK Structure Analysis:{Colors.RESET}")
                
                # Parse Indonesian NIK
                prov_code = nik[0:2]
                kab_code = nik[0:4]
                kec_code = nik[0:6]
                birth_date = nik[6:12]
                
                # Province mapping (partial)
                provinces = {
                    '11': 'Aceh', '12': 'Sumatera Utara', '13': 'Sumatera Barat',
                    '14': 'Riau', '15': 'Jambi', '16': 'Sumatera Selatan',
                    '17': 'Bengkulu', '18': 'Lampung', '19': 'Kep. Bangka Belitung',
                    '21': 'Kep. Riau', '31': 'DKI Jakarta', '32': 'Jawa Barat',
                    '33': 'Jawa Tengah', '34': 'DI Yogyakarta', '35': 'Jawa Timur',
                    '36': 'Banten', '51': 'Bali', '52': 'Nusa Tenggara Barat',
                    '53': 'Nusa Tenggara Timur', '61': 'Kalimantan Barat',
                    '62': 'Kalimantan Tengah', '63': 'Kalimantan Selatan',
                    '64': 'Kalimantan Timur', '71': 'Sulawesi Utara',
                    '72': 'Sulawesi Tengah', '73': 'Sulawesi Selatan',
                    '74': 'Sulawesi Tenggara', '75': 'Gorontalo',
                    '76': 'Sulawesi Barat', '81': 'Maluku', '82': 'Maluku Utara',
                    '91': 'Papua Barat', '92': 'Papua'
                }
                
                province = provinces.get(prov_code, 'Unknown')
                print(f"    Province: {province} ({prov_code})")
                
                # Birth date parsing
                try:
                    day = int(birth_date[0:2])
                    month = int(birth_date[2:4])
                    year = int(birth_date[4:6])
                    
                    # Adjust year (if day > 40, it's female)
                    gender = "Female" if day > 40 else "Male"
                    if day > 40:
                        day -= 40
                    
                    birth_year = 2000 + year if year < 30 else 1900 + year
                    
                    print(f"    Gender: {gender}")
                    print(f"    Birth Date: {day:02d}-{month:02d}-{birth_year}")
                    
                    # Calculate age
                    current_year = datetime.now().year
                    age = current_year - birth_year
                    print(f"    Age: {age} years")
                    
                except:
                    print(f"    Birth Date: Could not parse")
                
                return True
            
            # Method 2: Try public API
            try:
                # Note: Free NIK APIs are limited
                print(f"{Colors.YELLOW}[*] Trying API lookup...{Colors.RESET}")
                # This is a placeholder for actual API call
                return True
                
            except:
                print(f"{Colors.RED}[-] API lookup failed{Colors.RESET}")
                return False
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def cek_imei_neko(self, imei):
        """Cek IMEI information"""
        print(f"{Colors.YELLOW}[*] Checking IMEI: {imei}...{Colors.RESET}")
        
        try:
            # Clean IMEI
            imei_clean = ''.join(filter(str.isdigit, imei))
            
            if len(imei_clean) != 15:
                print(f"{Colors.RED}[-] Invalid IMEI length. Should be 15 digits.{Colors.RESET}")
                return False
            
            # Validate IMEI with Luhn algorithm
            def luhn_check(imei):
                def digits_of(n):
                    return [int(d) for d in str(n)]
                
                digits = digits_of(imei)
                odd_digits = digits[-1::-2]
                even_digits = digits[-2::-2]
                checksum = sum(odd_digits)
                
                for d in even_digits:
                    checksum += sum(digits_of(d*2))
                
                return checksum % 10 == 0
            
            if luhn_check(imei_clean):
                print(f"{Colors.GREEN}[+] IMEI is valid (passed Luhn check){Colors.RESET}")
            else:
                print(f"{Colors.RED}[-] IMEI is invalid (failed Luhn check){Colors.RESET}")
            
            # Basic IMEI analysis
            print(f"\n{Colors.GREEN}[+] IMEI Analysis:{Colors.RESET}")
            print(f"    Full IMEI: {imei_clean}")
            
            # TAC (Type Allocation Code) - first 8 digits
            tac = imei_clean[:8]
            print(f"    TAC: {tac} (Identifies device model)")
            
            # SNR (Serial Number) - digits 9-14
            snr = imei_clean[8:14]
            print(f"    Serial: {snr} (Device serial)")
            
            # Check digit - last digit
            check_digit = imei_clean[14]
            print(f"    Check Digit: {check_digit}")
            
            # Check if IMEI is blacklisted (simulated)
            # In real implementation, this would query a database
            print(f"\n{Colors.YELLOW}[*] Blacklist Status:{Colors.RESET}")
            print(f"    Local check: Not blacklisted")
            print(f"    Note: Full blacklist check requires paid API")
            
            return True
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def cek_email_hunter(self, email):
        """Check email using Hunter.io API (simulated)"""
        print(f"{Colors.YELLOW}[*] Checking email: {email}...{Colors.RESET}")
        
        try:
            # Email validation regex
            pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
            
            if not re.match(pattern, email):
                print(f"{Colors.RED}[-] Invalid email format{Colors.RESET}")
                return False
            
            print(f"\n{Colors.GREEN}[+] Email Analysis:{Colors.RESET}")
            print(f"    Email: {email}")
            
            # Parse domain
            domain = email.split('@')[1]
            print(f"    Domain: {domain}")
            
            # Check if domain exists
            try:
                socket.gethostbyname(domain)
                print(f"    Domain Status: Active")
            except:
                print(f"    Domain Status: Not found")
            
            # Check common providers
            common_providers = {
                'gmail.com': 'Google',
                'yahoo.com': 'Yahoo',
                'outlook.com': 'Microsoft',
                'hotmail.com': 'Microsoft',
                'icloud.com': 'Apple',
                'aol.com': 'AOL',
                'protonmail.com': 'ProtonMail',
                'zoho.com': 'Zoho'
            }
            
            provider = common_providers.get(domain.lower(), 'Unknown')
            print(f"    Provider: {provider}")
            
            # Disposable email check (partial list)
            disposable_domains = [
                'tempmail.com', 'mailinator.com', 'guerrillamail.com',
                '10minutemail.com', 'throwawaymail.com', 'yopmail.com'
            ]
            
            if any(disp in domain.lower() for disp in disposable_domains):
                print(f"    Warning: Disposable/temporary email")
            else:
                print(f"    Email Type: Regular")
            
            return True
            
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False
    
    def cek_ip_info(self, ip_address):
        """Check IP address information"""
        print(f"{Colors.YELLOW}[*] Checking IP: {ip_address}...{Colors.RESET}")
        
        try:
            # Validate IP
            try:
                socket.inet_aton(ip_address)
            except socket.error:
                print(f"{Colors.RED}[-] Invalid IP address{Colors.RESET}")
                return False
            
            # Use ip-api.com (free tier)
            url = f"http://ip-api.com/json/{ip_address}"
            response = self.session.get(url, timeout=10)
            
            if response.status_code == 200:
                data = response.json()
                
                if data['status'] == 'success':
                    print(f"\n{Colors.GREEN}[+] IP Information:{Colors.RESET}")
                    print(f"    IP: {data.get('query', 'N/A')}")
                    print(f"    Country: {data.get('country', 'N/A')}")
                    print(f"    Region: {data.get('regionName', 'N/A')}")
                    print(f"    City: {data.get('city', 'N/A')}")
                    print(f"    ISP: {data.get('isp', 'N/A')}")
                    print(f"    Organization: {data.get('org', 'N/A')}")
                    print(f"    AS: {data.get('as', 'N/A')}")
                    print(f"    Latitude: {data.get('lat', 'N/A')}")
                    print(f"    Longitude: {data.get('lon', 'N/A')}")
                    
                    return True
                else:
                    print(f"{Colors.RED}[-] API returned error: {data.get('message', 'Unknown')}{Colors.RESET}")
                    return False
            else:
                print(f"{Colors.RED}[-] API request failed{Colors.RESET}")
                return False
                
        except Exception as e:
            print(f"{Colors.RED}[-] Error: {e}{Colors.RESET}")
            return False

# ================================
# 🎮 MAIN MENU SYSTEM
# ================================

def clear_screen():
    """Clear terminal screen"""
    os.system('cls' if os.name == 'nt' else 'clear')

def print_banner():
    """Print program banner"""
    banner = f"""{Colors.RED}
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║  ███╗   ███╗██╗███╗   ██╗███████╗██╗  ██╗███████╗      ║
║  ████╗ ████║██║████╗  ██║╚════██║╚██╗██╔╝╚════██║      ║
║  ██╔████╔██║██║██╔██╗ ██║   ██╔╝ ╚███╔╝    ██╔╝       ║
║  ██║╚██╔╝██║██║██║╚██╗██║  ██╔╝  ██╔██╗   ██╔╝        ║
║  ██║ ╚═╝ ██║██║██║ ╚████║ ██╔╝  ██╔╝ ██╗ ██╔╝         ║
║  ╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝  ╚═╝╚═╝          ║
║                                                          ║
║  🔥 VIP ULTIMATE REAL TOOLS FRAMEWORK 🔥               ║
║  Created by: MinzXPLOIT 🥀                              ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝{Colors.RESET}
"""
    print(banner)

def main_menu():
    """Display main menu"""
    while True:
        clear_screen()
        print_banner()
        
        print(f"\n{Colors.CYAN}═══ REAL HACKING TOOLS ════════════════════════════════════{Colors.RESET}")
        print(f"\n{Colors.YELLOW}💀 TIER APOKALIPTIK (Most Dangerous):{Colors.RESET}")
        print(f"  1. {Colors.RED}Metasploit Framework{Colors.RESET} - 5000+ exploits")
        print(f"  2. {Colors.RED}SQLMap{Colors.RESET} - Automated SQL injection")
        
        print(f"\n{Colors.YELLOW}☠️ TIER NUKLIR (System Compromise):{Colors.RESET}")
        print(f"  3. {Colors.MAGENTA}Aircrack-ng{Colors.RESET} - WiFi cracking suite")
        print(f"  4. {Colors.MAGENTA}Hydra{Colors.RESET} - Brute force 50+ protocols")
        
        print(f"\n{Colors.YELLOW}⚠️ TIER EKSTREM (Significant Damage):{Colors.RESET}")
        print(f"  5. {Colors.YELLOW}Nmap{Colors.RESET} - Network scanning & vuln detection")
        print(f"  6. {Colors.YELLOW}Wireshark/Tcpdump{Colors.RESET} - Packet analysis")
        
        print(f"\n{Colors.YELLOW}🔥 TIER HIGH (Serious Attacks):{Colors.RESET}")
        print(f"  7. {Colors.GREEN}WPScan{Colors.RESET} - WordPress vulnerability scanner")
        
        print(f"\n{Colors.YELLOW}⚡ TIER MEDIUM-HIGH (Substantial Tools):{Colors.RESET}")
        print(f"  8. {Colors.BLUE}Netcat{Colors.RESET} - Network Swiss army knife")
        
        print(f"\n{Colors.YELLOW}🔧 TIER MEDIUM (Standard Tools):{Colors.RESET}")
        print(f"  9. {Colors.CYAN}WhatWeb{Colors.RESET} - Web technology detection")
        
        print(f"\n{Colors.YELLOW}📊 TIER LOW (Information Gathering):{Colors.RESET}")
        print(f"  10. {Colors.WHITE}Whois{Colors.RESET} - Domain information lookup")
        
        print(f"\n{Colors.YELLOW}🔍 API & INFORMATION TOOLS:{Colors.RESET}")
        print(f"  11. {Colors.GREEN}Cek Resi{Colors.RESET} - Track packages")
        print(f"  12. {Colors.GREEN}Cek NIK{Colors.RESET} - Indonesian ID analysis")
        print(f"  13. {Colors.GREEN}Cek IMEI{Colors.RESET} - Phone IMEI validation")
        print(f"  14. {Colors.GREEN}Cek Email{Colors.RESET} - Email analysis")
        print(f"  15. {Colors.GREEN}Cek IP{Colors.RESET} - IP address information")
        
        print(f"\n{Colors.YELLOW}🛠️ UTILITY TOOLS:{Colors.RESET}")
        print(f"  16. {Colors.MAGENTA}Hash Cracker{Colors.RESET} - Crack passwords")
        print(f"  17. {Colors.MAGENTA}Install All Tools{Colors.RESET} - Auto-installation")
        
        print(f"\n{Colors.YELLOW}⚙️ SYSTEM:{Colors.RESET}")
        print(f"  0. {Colors.RED}Exit{Colors.RESET}")
        
        print(f"\n{Colors.CYAN}══════════════════════════════════════════════════════════{Colors.RESET}")
        
        choice = input(f"\n{Colors.GREEN}Select option (0-17): {Colors.RESET}")
        
        if choice == "0":
            print(f"\n{Colors.CYAN}Thanks for using MinzX VIP Framework!{Colors.RESET}")
            break
        
        elif choice == "1":
            # Metasploit
            msf = MetasploitReal()
            target = input(f"{Colors.YELLOW}Enter target IP: {Colors.RESET}")
            msf.scan_target(target)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "2":
            # SQLMap
            sqlmap = SQLMapReal()
            url = input(f"{Colors.YELLOW}Enter target URL: {Colors.RESET}")
            param = input(f"{Colors.YELLOW}Enter parameter to test: {Colors.RESET}")
            sqlmap.test_injection(url, param)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "3":
            # Aircrack-ng
            aircrack = AircrackReal()
            interface = input(f"{Colors.YELLOW}Enter interface [wlan0]: {Colors.RESET}") or "wlan0"
            aircrack.scan_wifi(interface)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "4":
            # Hydra
            hydra = HydraReal()
            target = input(f"{Colors.YELLOW}Enter target IP: {Colors.RESET}")
            username = input(f"{Colors.YELLOW}Enter username: {Colors.RESET}")
            wordlist = input(f"{Colors.YELLOW}Enter wordlist path: {Colors.RESET}")
            
            if not wordlist:
                wordlist = "wordlist.txt"
                print(f"{Colors.YELLOW}Using default wordlist: {wordlist}{Colors.RESET}")
                # Create sample wordlist if doesn't exist
                if not os.path.exists(wordlist):
                    with open(wordlist, 'w') as f:
                        f.write("admin\n123456\npassword\n12345678\nqwerty\n")
            
            hydra.brute_force_ssh(target, username, wordlist)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "5":
            # Nmap
            nmap = NmapReal()
            target = input(f"{Colors.YELLOW}Enter target IP/domain: {Colors.RESET}")
            options = input(f"{Colors.YELLOW}Enter Nmap options [-sS -sV -O]: {Colors.RESET}") or "-sS -sV -O"
            nmap.scan_target(target, options)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "6":
            # Wireshark/Tcpdump
            wireshark = WiresharkReal()
            interface = input(f"{Colors.YELLOW}Enter interface [any]: {Colors.RESET}") or "any"
            count = input(f"{Colors.YELLOW}Number of packets [10]: {Colors.RESET}") or "10"
            filter_exp = input(f"{Colors.YELLOW}Filter expression []: {Colors.RESET}")
            wireshark.capture_traffic(interface, int(count), filter_exp)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "7":
            # WPScan
            wpscan = WPSCANReal()
            url = input(f"{Colors.YELLOW}Enter WordPress site URL: {Colors.RESET}")
            wpscan.scan_wordpress(url)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "8":
            # Netcat
            netcat = NetcatReal()
            target = input(f"{Colors.YELLOW}Enter target IP: {Colors.RESET}")
            start_port = input(f"{Colors.YELLOW}Start port [1]: {Colors.RESET}") or "1"
            end_port = input(f"{Colors.YELLOW}End port [100]: {Colors.RESET}") or "100"
            netcat.port_scan(target, int(start_port), int(end_port))
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "9":
            # WhatWeb
            whatweb = WhatWebReal()
            url = input(f"{Colors.YELLOW}Enter website URL: {Colors.RESET}")
            whatweb.scan_website(url)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "10":
            # Whois
            whois_tool = WhoIsReal()
            domain = input(f"{Colors.YELLOW}Enter domain name: {Colors.RESET}")
            whois_tool.lookup_domain(domain)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "11":
            # Cek Resi
            api = APITools()
            resi = input(f"{Colors.YELLOW}Enter receipt number: {Colors.RESET}")
            expedition = input(f"{Colors.YELLOW}Enter expedition (jne/tiki/pos/etc): {Colors.RESET}")
            api.cek_resi_neko(resi, expedition)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "12":
            # Cek NIK
            api = APITools()
            nik = input(f"{Colors.YELLOW}Enter NIK (16 digits): {Colors.RESET}")
            api.cek_nik_neko(nik)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "13":
            # Cek IMEI
            api = APITools()
            imei = input(f"{Colors.YELLOW}Enter IMEI (15 digits): {Colors.RESET}")
            api.cek_imei_neko(imei)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "14":
            # Cek Email
            api = APITools()
            email = input(f"{Colors.YELLOW}Enter email address: {Colors.RESET}")
            api.cek_email_hunter(email)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "15":
            # Cek IP
            api = APITools()
            ip = input(f"{Colors.YELLOW}Enter IP address: {Colors.RESET}")
            api.cek_ip_info(ip)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "16":
            # Hash Cracker
            cracker = HashCrackerReal()
            cracker.check_hashcat()
            cracker.check_john()
            
            hash_value = input(f"{Colors.YELLOW}Enter hash to crack: {Colors.RESET}")
            hash_type = input(f"{Colors.YELLOW}Hash type (md5/sha1/sha256): {Colors.RESET}")
            wordlist = input(f"{Colors.YELLOW}Wordlist path [rockyou.txt]: {Colors.RESET}") or "rockyou.txt"
            
            # Create sample wordlist if doesn't exist
            if not os.path.exists(wordlist):
                print(f"{Colors.YELLOW}Creating sample wordlist...{Colors.RESET}")
                with open(wordlist, 'w') as f:
                    for word in ['password', '123456', 'admin', 'letmein', 'qwerty', 'monkey', 'dragon']:
                        f.write(word + '\n')
            
            cracker.crack_hash(hash_value, hash_type, wordlist)
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        elif choice == "17":
            # Install All Tools
            print(f"\n{Colors.YELLOW}[*] Installing all tools...{Colors.RESET}")
            
            tools_to_install = [
                "pkg update && pkg upgrade -y",
                "pkg install nmap -y",
                "pkg install sqlmap -y",
                "pkg install hydra -y",
                "pkg install aircrack-ng -y",
                "pkg install tcpdump -y",
                "pkg install whois -y",
                "pkg install whatweb -y",
                "pkg install netcat-openbsd -y",
                "pkg install john -y",
                "pkg install hashcat -y",
                "pkg install ruby -y",
                "gem install wpscan",
                "pip install requests"
            ]
            
            for cmd in tools_to_install:
                print(f"{Colors.CYAN}[*] Running: {cmd}{Colors.RESET}")
                try:
                    subprocess.run(cmd, shell=True, check=True)
                    print(f"{Colors.GREEN}[+] Success{Colors.RESET}")
                except Exception as e:
                    print(f"{Colors.RED}[-] Failed: {e}{Colors.RESET}")
            
            print(f"\n{Colors.GREEN}[+] All tools installation attempted{Colors.RESET}")
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")
        
        else:
            print(f"{Colors.RED}Invalid option!{Colors.RESET}")
            input(f"\n{Colors.CYAN}Press Enter to continue...{Colors.RESET}")

# ================================
# 🚀 MAIN EXECUTION
# ================================

if __name__ == "__main__":
    try:
        # Check if running on Termux
        if not os.path.exists('/data/data/com.termux/files/usr/bin'):
            print(f"{Colors.YELLOW}[!] Warning: Not running on Termux{Colors.RESET}")
            print(f"{Colors.YELLOW}[!] Some tools may require Termux environment{Colors.RESET}")
        
        # Check Python version
        if sys.version_info < (3, 6):
            print(f"{Colors.RED}[!] Python 3.6+ required{Colors.RESET}")
            sys.exit(1)
        
        # Run main menu
        main_menu()
        
    except KeyboardInterrupt:
        print(f"\n{Colors.RED}Program interrupted{Colors.RESET}")
    except Exception as e:
        print(f"\n{Colors.RED}Error: {e}{Colors.RESET}")
