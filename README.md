xtractor
A simple CLI tool for extracting structured data (IP addresses, emails, URLs, etc.) from any file using strict regular expressions. It works on plain text, binaries, logs, images, archives — anything you can throw at it — by using strings and grep.
🔧 Supported Extraction Types
TypeDescriptionExampleipIPv4 only, valid octets192.168.1.1emailRFC-like, strict domain formatuser.name@domain.comphoneIntl. and US-like formats+1-202-555-0172, +44 20...urlStrict HTTP(S) linkhttps://example.com/pagemac6 hex pairs (colon-separated)00:1A:2B:3C:4D:5E
🚀 Installation
bashgit clone https://github.com/<your-username>/xtractor.git
cd xtractor
sudo bash install_xtractor.sh
This will install the xtractor command to /usr/local/bin/.
🧪 Usage
bashxtractor <file> <type>
Examples:
bashxtractor dump.bin ip
xtractor access.log email
If no arguments are provided, it will show a help menu.
