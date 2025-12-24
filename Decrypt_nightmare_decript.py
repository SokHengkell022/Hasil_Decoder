# Peta dekripsi, kebalikan dari peta enkripsi

decryption_map = {

    '﹅': 'A', '𐀳': 'B', '𓂀': 'C', '𐎋': 'D', '𐑀𐖬𐝒': 'E', '𐤟𐫦': 'F', '𐴵𐴵⅙': 'G', '𑊋𑊧𑊩': 'H',

    '𝉅𝈣𝈣': 'I', '𒊹': 'J', '𒐇': 'K', '𒐹': 'L', '𒐳': 'M', '𒐑𒑅𒓄': 'N', '🀰': 'O', '🂠': 'P',

    '𒐬𐂂': 'Q', 'ꤲ꥓': 'R', '꥟': 'S', '꧂꧁': 'T', '꧰ꧦꧦꧦ': 'U', 'ꥼ': 'V', '꫞': 'W', 'ꫛꫭ': 'X',

    '': 'Y', 'J': 'Z',

    '𝌈': '1', '𝌈𝌉': '2', '𝍖': '3', '𝌳': '4', '🨍🨙🨙': '5', '𒃯': '6', '𒅄': '7', '𒆔': '8',

    '𒇺': '9', '𒈞': '0',

    '': '+', '': '×', '': '÷', '': '=', '': '/', '': '_', '': '<', '': '>',

    '': '[', '': ']', '': '!', '': '@', '': '#', '': '$', '': '%', '': '^',

    '': '&', '': '*', 'i': '(', 'q': ')', 'bal': "'", '0': '"', '☆': ':',

    '*': ';', '₩': '?', '﹆': ',', '𖹌': '.'

}

# Fungsi dekripsi

def decrypt_text(text):

    decrypted_text = ""

    i = 0

    max_len = max(len(k) for k in decryption_map.keys())  # Panjang simbol terenkripsi terpanjang

    while i < len(text):

        matched = False

        # Coba cocokkan setiap simbol, mulai dari panjang terpanjang ke terpendek

        for length in range(max_len, 0, -1):  # Mulai dari simbol terpanjang

            if i + length <= len(text):

                temp_char = text[i:i+length]  # Ambil bagian teks yang akan diuji

                if temp_char in decryption_map:

                    decrypted_text += decryption_map[temp_char]  # Cocokkan dan tambahkan ke hasil dekripsi

                    i += length  # Lewati karakter yang sudah didekripsi

                    matched = True

                    break

        if not matched:

            decrypted_text += text[i]  # Jika tidak ditemukan, tambahkan karakter asli

            i += 1

    

    return decrypted_text

# Meminta input teks terenkripsi dari pengguna

input_text = input("Enter the text you want to decrypt: ")

# Menampilkan hasil dekripsi

decrypted_output = decrypt_text(input_text)

print("CONGRATULATIONS YOUR TEXT HAS BEEN DECRYPTED:", decrypted_output)
__import__('sys').exit()