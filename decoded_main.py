def l1lOOO():
    # junk
    x = 7422
    return x

import os, time, re, requests, socket, phonenumbers as pn
from phonenumbers import geocoder, carrier, timezone
from rich.console import Console
from rich.prompt import Prompt
from pyfiglet import Figlet

console = Console()
BANNER = Figlet(font="slant")
NIK_API = "https://api.fikmydomainsz.xyz/tools/nik?nik={nik}"

# ──────────── UTIL ────────────
def clear():
    os.system("cls" if os.name == "nt" else "clear")

def banner():
    clear()
    console.print(f"[bold cyan]{BANNER.renderText('NoctOsint')}[/bold cyan]")
    console.print("[bold cyan]Support Developer: t.me/noctrashop")
def wait():
    input("\n[Press Enter to continue]")

# ──────────── PHONE INFO ────────────
def phone_info():
    number = input("\n[?] Enter phone number: ").strip()
    if number.startswith("0"):  # auto ubah 08 → +62
        number = "+62" + number[1:]

    try:
        parsed = pn.parse(number)
        if not pn.is_valid_number(parsed):
            return console.print("[red]Invalid number![/red]")

        console.print("\n[bold cyan]📱 Phone Number Info[/bold cyan]\n")
        console.print(f"[green]Number              [/green]: {pn.format_number(parsed, pn.PhoneNumberFormat.INTERNATIONAL)}")
        console.print(f"[green]Location            [/green]: {geocoder.description_for_number(parsed, 'id') or 'Unknown'}")
        console.print(f"[green]Provider            [/green]: {carrier.name_for_number(parsed, 'id') or 'Unknown'}")
        zones = timezone.time_zones_for_number(parsed)
        console.print(f"[green]Timezone            [/green]: {', '.join(zones) if zones else 'Unknown'}")

    except Exception as e:
        console.print(f"[red]Error: {e}[/red]")
    wait()

# ──────────── USERNAME CHECKER ────────────
def username_checker():
    uname = input("\n[?] Enter username: ").strip()
    sites = {
        "Instagram": f"https://www.instagram.com/{uname}",
        "Twitter"  : f"https://x.com/{uname}",
        "TikTok"   : f"https://www.tiktok.com/@{uname}",
        "GitHub"   : f"https://github.com/{uname}",
        "Facebook" : f"https://www.facebook.com/{uname}",
        "Reddit"   : f"https://www.reddit.com/user/{uname}",
        "YouTube"  : f"https://www.youtube.com/@{uname}"
    }

    console.print(f"\n[bold cyan]🔎 Username Checker for [yellow]{uname}[/yellow][/bold cyan]\n")
    with console.status("[green]Checking...[/green]", spinner="dots"):
        time.sleep(0.5)
        for site, url in sites.items():
            try:
                r = requests.get(url, timeout=6)
                if r.status_code == 200:
                    console.print(f"[green][✔] {site}[/green]: {url}")
                else:
                    console.print(f"[red][✘] {site}[/red]: Not found")
            except:
                console.print(f"[yellow][!] {site}[/yellow]: Error")

    wait()

# ──────────── NIK CHECKER ────────────
def nik_checker():
    nik = re.sub(r"\D", "", input("\n[?] NIK (16 digits): ").strip())
    if len(nik) != 16:
        return console.print("[red]Invalid NIK! Must be 16 digits[/red]")

    url = NIK_API.format(nik=nik)
    with console.status("[green]Checking NIK...[/green]", spinner="dots"):
        try:
            r = requests.get(url, timeout=8, headers={"User-Agent": "OSINT-Toolz"})
            time.sleep(0.5)
        except:
            return console.print("[red]Network error![/red]")

    if r.status_code != 200:
        return console.print(f"[red]API Error {r.status_code}[/red]")

    try:
        j = r.json()
        data = j.get("result", {})
    except:
        return console.print(r.text)

    console.print("\n[bold cyan]🆔 NIK Lookup Result[/bold cyan]\n")

    mapping = {
        "nik": "NIK",
        "kelamin": "Jenis Kelamin",
        "lahir": "Tanggal Lahir",
        "lahir_lengkap": "Tanggal Lahir (Lengkap)",
    }
    for k, label in mapping.items():
        if k in data:
            console.print(f"[green]{label:22}[/green]: {data[k]}")

    if "provinsi" in data:
        console.print(f"[green]Provinsi              [/green]: {data['provinsi'].get('nama','')}")
    if "kotakab" in data:
        console.print(f"[green]Kabupaten/Kota       [/green]: {data['kotakab'].get('nama','')}")
    if "kecamatan" in data:
        console.print(f"[green]Kecamatan            [/green]: {data['kecamatan'].get('nama','')}")

    if "kode_wilayah" in data:
        console.print(f"[green]Kode Wilayah         [/green]: {data['kode_wilayah']}")
    if "nomor_urut" in data:
        console.print(f"[green]Nomor Urut           [/green]: {data['nomor_urut']}")

    if "tambahan" in data:
        console.print("\n[bold yellow]📌 Tambahan[/bold yellow]\n")
        for k, v in data["tambahan"].items():
            label = k.replace("_", " ").title()
            console.print(f"[cyan]{label:22}[/cyan]: {v}")

    wait()

# ──────────── IP TRACKER ────────────
def ip_tracker():
    ip_or_domain = input("\n[?] Enter IP address or Domain: ").strip()
    if not ip_or_domain:
        return console.print("[red]No input provided[/red]")

    # resolve domain ke IP
    try:
        ip_addr = socket.gethostbyname(ip_or_domain)
    except Exception:
        return console.print(f"[red]Invalid IP or Domain[/red]")

    # request ke ip-api.com
    try:
        r = requests.get(
            f"http://ip-api.com/json/{ip_addr}?fields=status,message,country,regionName,city,zip,isp,org,timezone,query",
            timeout=10
        )
        data = r.json()
        if data.get("status") != "success":
            return console.print(f"[red]Error: {data.get('message','Unknown')}[/red]")

        console.print("\n[bold cyan]🌐 IP Lookup Result[/bold cyan]\n")
        console.print(f"[green]IP Address        [/green]: {data.get('query')}")
        console.print(f"[green]Country           [/green]: {data.get('country')}")
        console.print(f"[green]Region/State     [/green]: {data.get('regionName')}")
        console.print(f"[green]City              [/green]: {data.get('city')}")
        console.print(f"[green]ZIP               [/green]: {data.get('zip')}")
        console.print(f"[green]ISP               [/green]: {data.get('isp')}")
        console.print(f"[green]Org               [/green]: {data.get('org')}")
        console.print(f"[green]Timezone          [/green]: {data.get('timezone')}")
    except Exception as e:
        console.print(f"[red]Error: {e}[/red]")

    wait()

# ──────────── MAIN MENU ────────────
def main():
    while True:
        banner()
        console.print("[bold yellow]1.[/bold yellow] Phone Info")
        console.print("[bold yellow]2.[/bold yellow] Username Checker")
        console.print("[bold yellow]3.[/bold yellow] NIK Checker")
        console.print("[bold yellow]4.[/bold yellow] IP Tracker")
        console.print("[bold yellow]5.[/bold yellow] Exit\n")
        choice = Prompt.ask("[cyan]Select option[/cyan]", choices=["1","2","3","4","5"])

        if choice == "1": phone_info()
        elif choice == "2": username_checker()
        elif choice == "3": nik_checker()
        elif choice == "4": ip_tracker()
        elif choice == "5":
            console.print("[bold red]GopdBye![/bold red]"); break

if __name__ == "__main__":
    main()
