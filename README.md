# xtractor

---

Xtractor is a **command-line tool** designed for extracting structured data from any file type. It identifies and extracts well-formed data such as **IP addresses, email addresses, URLs, phone numbers, and MAC addresses** by employing string analysis and strict regular expressions. This makes it an ideal tool for analyzing various data sources, including logs, binary dumps, disk images, and raw files.

---

### Supported Extraction Types

| Type  | Description                | Example                          |
| ----- | -------------------------- | -------------------------------- |
| **ip** | IPv4 only, valid octets    | `192.168.1.1`                    |
| **email** | Strict domain format | `user.name@domain.com`           |
| **phone** | International and US-like number formats | `+1-202-555-0172`, `+44 20...`    |
| **url** | Strict HTTP(S) link        | `https://example.com/page`       |
| **mac** | 6 hex pairs (colon-separated) | `00:1A:2B:3C:4D:5E`              |

---

### Installation

To install xtractor, follow these steps:

`git clone https://github.com/ThinkCyberProjects/xtractor.git`  
`cd xtractor`  
`sudo bash install_xtractor.sh`

This script will install the `xtractor` command to `/usr/local/bin/`.

---

### Usage

The basic syntax for using xtractor is:

xtractor <file> <type>


### Examples

```bash
xtractor dump.bin ip
xtractor logs.txt email
xtractor archive.img url


If no arguments are provided, xtractor will display a help menu detailing all supported types and example patterns.

