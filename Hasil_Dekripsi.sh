gitpull
clear
figlet install bahan kang
echo "Menginstal bahan yang dibutuhkan..."
apt update && apt upgrade
apt install python3
apt install python3 python3-pip
apt install python ffmpeg
pip3 install yt-dlp
apt install figlet
apt install pip
apt install git
apt install x11-repo
apt install qrecode
apt install cowsay
apt install -y python3 pip wget whois nano proot-distro sl neofetch figlet toilet python2 pipx cowsay nyancat tty-clock libcaca youtube-dl yt-dlp
clear
blue='\033[34;1m'
green='\033[32;1m'
purple='\033[35;1m'
cyan='\033[36;1m'
red='\033[31;1m'
white='\033[37;1m'
yellow='\033[33;1m'

echo -e $yellow
echo "SASTRA" | figlet | pv -qL 193
echo -e $cyam
cowsay -f turtle "Jangan recode hitam SC gw anjing"
echo -e $green
echo "Tanggal & Bulan Tahun dan Jam Sekarang"
cal && echo -e "Jam Sekarang: $(date +'%H:%M:%S')"

echo -e $blue
figlet -f bubble SELAMAT DATANG REK
echo
echo -e $cyan "MENU DI PILIH ANJING"
echo
echo -e $green
echo "1: IP TRACKING                     11: Install Bahan"
echo "2: JARINGAN STABILKAN              12: Subrek Channel YT"
echo "3: WA Pembuat                     13: Buat Banner Pakai Nama"
echo "4: SCAN PHSING                    14: Follow GitHub"
echo "5: DOKSLI WEB                      15: Userland"
echo "6: KELUAR                          16: QR Code dari Teks/Link"
echo "7: PHSING                          17: Enkripsi Bash"
echo "8: JOIN GRUP                       18: Ramalan Cuaca"
echo "9: Tracer Nomer                   19: Spam Pairing Code"
echo "10: Username Tracker               20: YouTube Downloader"
echo "21: TikTok Downloader               22: IG Downloader"
echo "23: Metode Unban WhatsApp          24: Cek IP Server"
echo "25: Cek Kecepatan Internet         26: Catat Tugas Harian"
echo "27: Reminder Waktu                 28: Uji Keamanan Wi-Fi"
echo "29: Catat Pengeluaran               30: Cek Status Domain"
echo                    "31:encrypt kata kata"
echo                    "32:decrypt kata kata"
echo                    "33:"
echo                    "34:SPAM OTP"
echo
echo
read -p "Pilih mana: " bro

case "$bro" in
    1)
      clear
      figlet -f smscript "Sastra"
      echo "Masukkan IP yang ingin dilacak:"
      read ip
      echo "info 1"
      response_ipinfo=$(curl -s ipinfo.io/$ip)
      echo $response_ipinfo | jq

      echo -e "\info 2"
      response_ipapi=$(curl -s http://ip-api.com/json/$ip)
      echo $response_ipapi | jq

      echo -e "\info 3"
      response_ipwhois=$(curl -s https://ipwhois.app/json/$ip)
      echo $response_ipwhois | jq

     echo -e "\info 4"
     response_ipapi_co=$(curl -s https://ipapi.co/$ip/json)
     echo $response_ipapi_co | jq

     echo -e "\info 5"
     response_freegeoip=$(curl -s https://freegeoip.app/json/$ip)
     echo $response_freegeoip | jq

     vpn_status=$(echo $response_ipinfo | jq '.privacy.vpn')
     if [ "$vpn_status" == "true" ]; then
     echo "Apakah ini VPN: Ya"
     else
     echo "Apakah ini VPN: Tidak"
     fi

     if [[ $ip =~ ^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[0-1])) ]]; then
     echo "IP Palsu: Ya (IP pribadi)"
     else
     echo "IP Palsu: Tidak diketahui"
     fi
        ;;
    2)
        ping 1.1.1.1
        ;;
    3)
        xdg-open "https://wa.me/6281277769327"
        ;;
    4)
        clear

        read -p "Masukkan URL untuk scan: " url
        echo "Mendownload halaman dari $url ..."
        wget -q --spider $url

        if [ $? -ne 0 ]; then
            echo "URL tidak dapat dijangkau. Cek koneksi atau URL."
            exit 1
        fi

        if [[ $url == https* ]]; then
            echo "Situs menggunakan SSL (HTTPS)."
        else
            echo "Peringatan: Situs tidak menggunakan SSL (HTTP)."
        fi

        echo "Memeriksa informasi domain..."
        whois_result=$(whois $url)
        echo "$whois_result" | grep -i "Creation Date"

        if [[ $url == *"login"* || $url == *"bank"* || $url == *"secure"* ]]; then
            echo "Peringatan: URL mengandung kata-kata mencurigakan."
        fi

        echo "Mengecek halaman untuk potensi elemen phishing..."
        html=$(wget -qO- $url)

        if echo "$html" | grep -q -i "password"; then
            echo "Peringatan: Halaman ini meminta password!"
        fi

        if echo "$html" | grep -q -i "credit card"; then
            echo "Peringatan: Halaman ini meminta informasi kartu kredit!"
        fi

        echo "Scan selesai."
        ;;
    5)
        clear
        figlet sastra
        echo "BERIKAN DOMAIN NYA:"
        read domain
        whois $domain
        ;;
    6)
        clear
        exit
        ;;
    7)
        git clone https://github.com/Sastrakasia/Phising
        cd Phising
        bash Phisin
        ;;
    9)
        clear
        figlet sastra
        git clone https://github.com/Shen367/phone-number-tracker
        cd phone-number-tracker
        pip3 install phonenumbers
        pip3 install colorama
        pip3 install requests
        git pull
        pip3 install pyfiglet
        python3 Tracker
        ;;
    10)
        clear
        git clone https://github.com/Shen367/Username-tracker
        cd Username-tracker
        pip install requests
        python Username-trackee
        echo -e $blue
        ;;
    11)
        echo "Baha sudah diinstal."
        ;;
    12)
        clear
        echo "Channel 1, 2, 3 🗿"
        xdg-open "https://youtube.com/@sastra12390?si=7PAoQWhNdqG6syLH"
        ;;
    13)
        read -p "asukkan Nama: " nama
        echo > ~/.bashrc
        echo 'clear' >> ~/.bashrc
        echo "toilet -f block -F gay $nama" >> ~/.bashrc
        echo 'neofetch --ascii_distro ipglr' >> ~/.bashrc
        echo "cowsay -f turtle 'Selamat Datang $nama'" >> ~/.bashrc
        ;;
    14)
        xdg-open "https://github.com/"
        ;;
    15)
        pkg install git wget neofetch
        git clone https://github.com/Shen367/userland-v3
        cd userland-v3
        git pull
        sh userland-v3
        ;;
    16)
        read -p "Masukkan teks/link: " pantek
        echo $pantek | qrencode -t ANSI256
        ;;
    17) git clone https://github.com/Shen367/Encrypt-bash
        cd Encrypt-bash
	echo "masukan nama script"
	read nama
	nano $nama
        bash Kunci.sh
	cd Encrypt-bash
        ;;
    18)
        curl wttr.in
        ;;
    19)
        git clone https://github.com/ZeltNamizake/spcwa
        cd spcwa
        npm start
        ;;
    20)
        read -p "Masukkan URL video YouTube yang ingin diunduh: " video_url
        youtube-dl $video_url
        echo "Video telah diunduh."
        ;;
    21)
        read -p "Masukkan URL video TikTok: " url
        download_folder="$HOME/storage/shared/Download/TikTok"
        mkdir -p "$download_folder"
        yt-dlp -o "$download_folder/%(title)s.%(ext)s" "$url"
        echo "Video berhasil diunduh ke folder $download_folder"
        cd /data/data/com.termux/files/home/storage/shared/Download/TikTok
        ls
        echo "masukan bagian yang ada di ls salin ya"
        read name
        mv name /storage/emulated/0/DCIM/
        ;;
    22)
        read -p "Masukkan URL Instagram yang ingin diunduh: " ig_url
        yt-dlp $ig_url
        echo "Video Instagram telah diunduh."
        ;;
    23)
        echo "Metode Unban WhatsApp:"
        echo "1. Hapus aplikasi WhatsApp dan reinstall."
        echo "2. Gunakan nomor telepon yang berbeda."
        echo "3. Gunakan aplikasi VPN saat mendaftar."
        echo "4. Tunggu beberapa hari dan coba lagi."
        ;;
    24)
        read -p "Masukkan IP Server yang ingin dicek: " server_ip
        ping -c 4 $server_ip
        ;;
    25)
        echo "Cek kecepatan internet..."
        speedtest
        ;;
    26)
        read -p "Masukkan tugas harian: " tugas
        echo $tugas >> ~/tugas_harian.txt
        echo "Tugas telah dicatat."
        ;;
    27)
        read -p "Masukkan waktu reminder (contoh: '12:00'): " waktu
        echo "Reminder akan dikirimkan pada $waktu."
        echo "Pada jam $waktu, Anda akan mendapatkan pengingat."
        ;;
    28)
        echo "Uji Keamanan Wi-Fi..."
        airmon-ng
        ;;
    29)
        read -p "Masukkan pengeluaran: " pengeluaran
        echo $pengeluaran >> ~/pengeluaran.txt
        echo "Pengeluaran telah dicatat."
        echo "kalo mau tau liat di pengeluaran.txt"
        ;;
    30)
        read -p "Masukkan domain yang ingin dicek statusnya: " domain_status
        whois $domain_status
        ;;
    31)
       read -p "masukan kata kata: " kontol
       echo $kontol | base64
       ;;

   32)
      read -p "Manukan kata kata: " ah_yameteh
      echo $ah_yameteh | base64 -d
      ;;

   34)
      git clone https://github.com/Shen367/Spam-otp
      cd Spam-otp
      python OTP
      ;;

    * )
       echo "Pilihan tidak valid. Silakan coba lagi."
        ;;
esac
