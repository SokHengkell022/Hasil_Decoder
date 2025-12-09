
import os
import requests
import time
import sys
import random
import phonenumbers
from phonenumbers import geocoder, carrier
from rich.console import Console
from rich.table import Table
from rich.progress import track
from rich.markdown import Markdown
import getpass
from phonenumbers import timezone as phonenumbers_timezone
console = Console()

def clear():
    os.system('cls' if os.name == 'nt' else 'clear')

def loading(text, seconds=2):
    for _ in track(range(seconds), description=text):
        time.sleep(1)

def banner():
    clear()
    console.print('\n╭──────────────────────────────────────────╮\n│ 🔥 Cyber Toolkit 🔥                      │\n│ 📌 Tools Hacking, OSINT & Cyber Security │\n╰──────────────────────────────────────────╯\n', style='bold cyan')

def login():
    clear()
    correct_username = './'
    correct_password = 'admin1234'
    p()
    print('🔥 cari username and pasword di link tersebut 🔥 : https://sfile.mobi/7SWYF5QhckD ')
    username = input('⚡ Username: ')
    password = getpass.getpass(prompt='⚡ Password: ')
    if username!= correct_username or password!= correct_password:
        print('')
        print('⚡ yahhh username and pasword salah')
        sys.exit(1)
    else:  # inserted
        print('⚡ Welcome to Cyber Toolkit 🔥')
        time.sleep(0.3)
        ascii_vro()

def ascii_vro():
    clear()
    frames = ['\n     / **/|        \n     | == /        \n      |  |         \n      |  |         \n      |  /         \n       |/   \n        ', '\n     / **/|        \n     | == /        \n      |  |         \n      |  |         \n      |  /         \n       |/   \n        ', '\n     / **/|        \n     | == /        \n      |  |        \n        ', '\n     _.-^^---....,,--       \n _--                  --_  \n<                        >)\n|                         | \n \\._                   _./  \n    ```--. . , ; .--\'\'\'       \n          | |   |             \n       .-=||  | |=-.   \n       `-=#$%&%$#=-\'   \n          | ;  :|     \n _____.,-#%&$@%#&#~,._____\n    ']
    for frame in frames:
        clear()
        print(frame)
        time.sleep(0.6)
    clear()

def install_metasploit():
    console.print('[bold yellow]⚡ Mengecek Metasploit...[/bold yellow]')
    if os.system('command -v msfconsole > /dev/null 2>&1')!= 0:
        console.print('[bold yellow]⚠️ Metasploit belum terinstall, menginstall sekarang...[/bold yellow]')
        os.system('pkg update && pkg upgrade -y')
        os.system('pkg install curl -y')
        os.system('curl -fsSL https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/metasploit.sh | bash')
    console.print('[bold green]✅ Metasploit terinstall! Menjalankan...[/bold green]')
    os.system('msfconsole')
import requests
import random
import time
from rich.console import Console
from rich.progress import track
console = Console()

def track_ip():
    clear()
    banner()
    ip = console.input('[bold cyan]Masukkan IP target: [/bold cyan]')
    loading('🔍 Melacak IP...', 3)
    try:
        response = requests.get(f'https://ipinfo.io/{ip}/json')
        data = response.json()
        table = Table(title='📍 Hasil Track IP', show_header=True, header_style='bold green')
        table.add_column('Info', style='cyan')
        table.add_column('Data', style='magenta')
        for key, value in data.items():
            table.add_row(key.capitalize(), str(value))
        console.print(table)
    except:
        console.print('[bold red]❌ Gagal melacak IP![/bold red]')
    else:  # inserted
        pass  # postinserted
    console.input('\n[bold yellow]Tekan Enter untuk kembali ke menu...[/bold yellow]')
    menu()

def track_phone():
os.system('clear')
    console.print('[bold cyan]📱 Track Phone Number[/bold cyan]')
    console.print('[bold yellow]Masukkan nomor telepon (format internasional, misal +62): [/bold yellow]', end='')
    nomor = input().strip()
    try:
        parsed_number = phonenumbers.parse(nomor)
        if phonenumbers.is_valid_number(parsed_number):
            table = Table(title='📞 Phone Number Information', header_style='bold cyan')
            table.add_column('Info', style='bold yellow')
            table.add_column('Detail', style='bold green')
            table.add_row('📱 Nomor Telepon', nomor)
            table.add_row('✅ Valid', 'Ya')
            table.add_row('🌎 Format Internasional', phonenumbers.format_number(parsed_number, phonenumbers.PhoneNumberFormat.INTERNATIONAL))
            table.add_row('🏠 Format Nasional', phonenumbers.format_number(parsed_number, phonenumbers.PhoneNumberFormat.NATIONAL))
            table.add_row('🔢 Format E164', phonenumbers.format_number(parsed_number, phonenumbers.PhoneNumberFormat.E164))
            table.add_row('📍 Lokasi (Geocoder)', geocoder.description_for_number(parsed_number, 'id'))
            table.add_row('📡 Operator (Carrier)', carrier.name_for_number(parsed_number, 'id'))
            table.add_row('🕒 Zona Waktu', ', '.join(phonenumbers_timezone.time_zones_for_number(parsed_number)))
            table.add_row('❓ Kemungkinan Nomor?', 'Ya' if phonenumbers.is_possible_number(parsed_number) else 'Tidak')
            table.add_row('📞 Tipe Nomor', str(phonenumbers.number_type(parsed_number)))
            console.print(table)
        else:  # inserted
            console.print('[bold red]❌ Nomor telepon tidak valid.[/bold red]')
    except Exception as e:
        console.print(f'[bold red]⚠️ Error: {str(e)}[/bold red]')

def whois_lookup():
    clear()
    banner()
    domain = console.input('[bold cyan]Masukkan domain target: [/bold cyan]')
    loading(f'🔍 Mengambil data Whois untuk {domain}...', 3)
    try:
        response = os.popen(f'whois {domain}').read()
        if 'No match' in response or 'NOT FOUND' in response:
            console.print('[bold red]❌ Data Whois tidak ditemukan![/bold red]')
        else:  # inserted
            console.print(f'[bold yellow]📄 Hasil Whois untuk {domain}:[/bold yellow]\n')
            console.print(response)
    except Exception as e:
        pass  # postinserted
    else:  # inserted
        console.input('\n[bold yellow]Tekan Enter untuk kembali ke menu...[/bold yellow]')
        menu()
        console.print(f'[bold red]❌ Gagal mengambil data Whois: {e}[/bold red]')

def nmap_scan():
    clear()
    banner()
    target = console.input('[bold cyan]Masukkan target IP/Domain: [/bold cyan]')
    loading('🔍 Scanning...', 5)
    os.system(f'nmap -A {target}')
    console.input('\n[bold yellow]Tekan Enter untuk kembali ke menu...[/bold yellow]')
    menu()

def about_me():
    clear()
    banner()
    table = Table(title='👤 About Me', show_header=True, header_style='bold cyan')
    table.add_column('Info', style='green', justify='right')
    table.add_column('Data', style='magenta', justify='left')
    table.add_row('Nama', 'loard')
    table.add_row('NO HP', '+62895403397411')
    table.add_row('GitHub', 'https://github.com/limit9172')
    table.add_row('Tujuan', 'Cyber Security & OSINT')
    table.add_row('Versi', '1.0')
    console.print(table)
    console.input('\n[bold yellow]Tekan Enter untuk kembali ke menu...[/bold yellow]')
    menu()

def exit_script():
    console.print('[bold yellow]👋 Bye! Sampai jumpa lagi![/bold yellow]')
    sys.exit()

def invalid_choice():
    console.print('[bold red]❌ Pilihan tidak valid![/bold red]')
    time.sleep(1)
    menu()

def p():
    console.print('[bold green]██╗      ██████╗  ██████╗ ██╗███╗   ██╗[/bold green]')
    console.print('[bold green]██║     ██╔═══██╗██╔════╝ ██║████╗  ██║[/bold green]')
    console.print('[bold green]██║     ██║   ██║██║  ███╗██║██╔██╗ ██║[/bold green]')
    console.print('[bold green]██║     ██║   ██║██║   ██║██║██║╚██╗██║[/bold green]')
    console.print('[bold green]███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║[/bold green]')
    console.print('[bold green]╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝[/bold green]')

def menu():
    banner()
    table = Table(title='📌 Main Menu', show_header=True, header_style='bold magenta')
    table.add_column('No', justify='center', style='cyan', width=5)
    table.add_column('Fitur', justify='left', style='green', width=30)
    menu_list = [('1', 'Track IP Address'), ('2', 'Track Phone Number'), ('3', 'Whois Lookup'), ('4', 'Spam-Call'), ('5', 'Metasploit'), ('6', 'Nmap Scan'), ('7', 'About Me'), ('8', 'Exit')]
    for item in menu_list:
        table.add_row(item[0], item[1])
    console.print(table)
    pilihan = console.input('[bold cyan]Pilih opsi: [/bold cyan]')
    menu_actions = {'1': track_ip, '2': track_phone, '3': whois_lookup, '4': spam_call, '5': install_metasploit, '6': nmap_scan, '7': about_me, '8': exit_script}
    action = menu_actions.get(pilihan, invalid_choice)
    action()
login()
menu()