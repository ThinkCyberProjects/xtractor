#!/bin/bash

# Installer script for xtractor
# It creates the xtractor tool in /usr/local/bin and makes it executable

TARGET="/usr/local/bin/xtractor"

echo "[*] Installing xtractor to $TARGET..."

if [ "$(id -u)" -ne 0 ]; then
  echo "[!] This script must be run as root. Use: sudo ./install_xtractor.sh"
  exit 1
fi

cat > "$TARGET" << 'EOF'
#!/bin/bash

# xtractor - Extract specific data types from files using regex

show_help() {
  cat << HELP
xtractor - extract specific data types from a file
 
=== Created by DS ===
 
Usage:
  xtractor <file> <type>

Supported Extraction Types (Strict):
  Type     Description                        Example Match
  ip       IPv4 only, valid octets            192.168.1.1
  email    Strict domain                      user.name@domain.com
  phone    Strict formats, incl. intl.        +1-202-555-0172, +44 20 7946 0958
  url      http(s), strict TLD/domain         https://example.com/page?arg=val
  mac      6 hex pairs                        00:1A:2B:3C:4D:5E


HELP
  exit 1
}

# Check arguments
if [ $# -ne 2 ]; then
  show_help
fi

file="$1"
type="$2"

if [ ! -f "$file" ]; then
  echo "Error: File '$file' not found."
  exit 1
fi

case "$type" in
  ip)
    regex='\b((25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9]?[0-9])\b'
    ;;
  email)
    regex='\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b'
    ;;
  phone)
    regex='\+?[0-9]{1,3}[ -]?(\([0-9]{2,4}\)|[0-9]{2,4})[ -]?[0-9]{3,4}[ -]?[0-9]{3,4}'
    ;;
  url)
    regex='\bhttps?:\/\/[A-Za-z0-9.-]+\.[A-Za-z]{2,}(\/\S*)?\b'
    ;;
  mac)
    regex='\b([A-Fa-f0-9]{2}:){5}[A-Fa-f0-9]{2}\b'
    ;;
  *)
    echo "Unknown type: $type"
    show_help
    ;;
esac

strings "$file" | grep -Eo "$regex" | sort | uniq
EOF

chmod +x "$TARGET"
echo "[+] xtractor installed to $TARGET"
echo "    Usage: xtractor <file> <type>"
echo "    Run 'xtractor' with no args to see help."
