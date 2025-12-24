import os

# Fungsi untuk membersihkan layar

def clear_screen():

    os.system('clear')

# Fungsi untuk menambahkan warna RGB ke teks

def color_text_rgb(r, g, b, text):

    return f"\033[38;2;{r};{g};{b}m{text}\033[0m"

# ANSI escape code for yellow

YELLOW = "\033[93m"

RESET = "\033[0m"

# Banned text

banned_text = """

    _   ___       __    __                            ______                 __ 

   / | / (_)___ _/ /_  / /_____ ___  ____ _________  / ____/______  ______  / /_

  /  |/ / / __ `/ __ \/ __/ __ `__ \/ __ `/ ___/ _ \/ /   / ___/ / / / __ \/ __/

 / /|  / / /_/ / / / / /_/ / / / / /_/ / /  /  __/ /___/ /  / /_/ / /_/ / /_  

/_/ |_/_/\__, /_/ /_/\__/_/ /_/ /_/\__,_/_/   \___/\____/_/   \__, / .___/\__/  

        /____/                                               /____/_/           

"""

# Peta enkripsi dengan simbol yang diperbaiki

encryption_map = {

    'A': '﹅', 'B': '𐀳', 'C': '𓂀', 'D': '𐎋', 'E': '𐑀𐖬𐝒', 'F': '𐤟𐫦', 'G': '𐴵𐴵⅙', 'H': '𑊋𑊧𑊩',

    'I': '𝉅𝈣𝈣', 'J': '𒊹', 'K': '𒐇', 'L': '𒐹', 'M': '𒐳', 'N': '𒐑𒑅𒓄', 'O': '🀰', 'P': '🂠',

    'Q': '𒐬𐂂', 'R': 'ꤲ꥓', 'S': '꥟', 'T': '꧂꧁', 'U': '꧰ꧦꧦꧦ', 'V': 'ꥼ', 'W': '꫞', 'X': 'ꫛꫭ',

    'Y': '', 'Z': 'J',

    '1': '𝌈', '2': '𝌈𝌉', '3': '𝍖', '4': '𝌳', '5': '🨍🨙🨙', '6': '𒃯', '7': '𒅄', '8': '𒆔',

    '9': '𒇺', '0': '𒈞',

    '+': '', '×': '', '÷': '', '=': '', '/': '', '_': '', '<': '', '>': '',

    '[': '', ']': '', '!': '', '@': '', '#': '', '$': '', '%': '', '^': '',

    '&': '', '*': '', '(': 'i', ')': 'q', "'": "bal", '"': '0', ':': '☆',

    ';': '*', '?': '₩', ',': '﹆', '.': '𖹌'

}

# Fungsi enkripsi

def encrypt_text(text):

    encrypted_text = ""

    for char in text.upper():

        if char in encryption_map:

            encrypted_text += encryption_map[char]

        else:

            encrypted_text += char

    return encrypted_text

# Bersihkan layar

clear_screen()

# Menampilkan teks banned dengan warna RGB merah

colored_banned_text = color_text_rgb(255, 0, 0, banned_text)

print(colored_banned_text)

# Garis pemisah untuk memperindah tampilan

print("=" * 60)

# Sambutan

print("𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐭𝐨 𝐭𝐡𝐞 𝐞𝐧𝐜𝐫𝐲𝐩𝐭𝐢𝐨𝐧 𝐭𝐨𝐨𝐥𝐬!")

# Meminta input teks dari pengguna

input_text = input("Enter Text To Encrypt: ")

# Menampilkan hasil enkripsi dengan warna kuning

encrypted_output = encrypt_text(input_text)

print(f"{YELLOW}The Encrypted text: {encrypted_output}{RESET}")

print("Free decryption tool please visit my youtube copyrect=@rendyx_solo-player")

# Garis pemisah akhir

print("=" * 60)
__import__('sys').exit()