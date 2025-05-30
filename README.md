xtractor
xtractor is a command-line tool for extracting structured data such as IP addresses, emails, URLs, phone numbers, MAC addresses, and more — from any type of file. It uses strings and strict regular expressions to extract only well-formed data, making it useful for analysis of logs, binary dumps, disk images, and raw files.
🧠 Supported Extraction Types
TypeDescriptionExampleipIPv4 only, valid octets192.168.1.1emailRFC-like, strict domain formatuser.name@domain.comphoneIntl. and US-like number formats+1-202-555-0172, +44 20...urlStrict HTTP(S) linkhttps://example.com/pagemac6 hex pairs (colon-separated)00:1A:2B:3C:4D:5E
🚀 Installation
bashgit clone https://github.com/<your-username>/xtractor.git
cd xtractor
sudo bash install_xtractor.sh
This will install the xtractor command to /usr/local/bin/.
🧪 Usage
bashxtractor <file> <type>
🔹 Examples
bashxtractor dump.bin ip
xtractor logs.txt email
xtractor archive.img url
If no arguments are provided, it will show a help menu with all supported types and example patterns.

📜 License
This project is licensed under the MIT License.
✍️ Created by DS
