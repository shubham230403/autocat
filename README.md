
# AutoCat - Netcat Automation Tool with Nmap Integration

## Table of Contents
1. [Description](#description)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Options](#options)
6. [Nmap Scan Types](#nmap-scan-types)
7. [Saving Output](#saving-output)
8. [Contributing](#contributing)
9. [Contact](#contact)

---

## Description
**AutoCat** is a versatile automation tool designed to simplify common tasks in cybersecurity using **Netcat** and **Nmap**. With this tool, users can automate port scanning, set up and connect to listeners, transfer files, and save scan results in various formats. It supports advanced nmap scan options such as aggressive, stealth, script, and firewall-bypassing scans.

AutoCat offers a user-friendly and colorful command-line interface, making it both functional and aesthetically pleasing. Created with the intention of streamlining tasks for cybersecurity professionals.

---

## Features
- **Netcat Automation**:
  - Set up and connect to Netcat listeners.
  - File transfer between systems using Netcat.
  
- **Nmap Integration**:
  - Perform aggressive, stealth, script, and firewall-bypassing scans.
  - Save scan results in XML or plaintext format.
  - User-defined port ranges and scan options.
  
- **Customizable Output**:
  - Colorful, aesthetic terminal output.
  - Ability to save scan results in your preferred format (XML or plaintext).

- **Help Switch**:
  - Easily accessible help menu to guide users through the tool.

---

## Installation
1. **Download the AutoCat script**:
    ```bash
    wget https://path-to-your-script/auto-cat.sh](https://github.com/HackersParadisee/AutoCat.git
    ```

2. **Make the script executable**:
    ```bash
    chmod +x auto-cat.sh
    ```

3. **Ensure Netcat and Nmap are installed**:
    AutoCat relies on `Netcat` and `Nmap`. Install them with the following commands:
    - **Netcat**:
      ```bash
      sudo apt install netcat
      ```
    - **Nmap**:
      ```bash
      sudo apt install nmap
      ```

---

## Usage
Run the AutoCat script from the terminal:

```bash
./auto-cat.sh
```

### Basic Workflow:
1. **Nmap Scans**: Choose option `1` to perform various nmap scans (aggressive, stealth, script, or firewall-bypassing).
2. **Netcat Listener**: Set up a Netcat listener by selecting option `2`.
3. **Connect to a Listener**: Connect to a previously set listener with option `3`.
4. **File Transfer**: Send or receive files between systems using option `4`.
5. **Exit**: Choose option `5` to quit the tool.

---

## Options

| Option | Description                                                |
|--------|------------------------------------------------------------|
| 1      | Nmap Scans: Perform various types of scans on a target IP.  |
| 2      | Netcat Listener: Set up a listener on a specified port.     |
| 3      | Connect Listener: Connect to a listener using Netcat.       |
| 4      | File Transfer: Send or receive files between systems.       |
| 5      | Exit: Exit the AutoCat tool.                                |
| --help | Display the help menu for AutoCat usage.                    |

---

## Nmap Scan Types

AutoCat offers various Nmap scan options:

- **Aggressive Scan**: Performs version detection, OS detection, and traceroute (`nmap -A`).
- **Stealth Scan (SYN)**: Conducts a stealthy SYN scan, often undetected by firewalls (`nmap -sS`).
- **Script Scan**: Uses default scripts for common vulnerabilities and network information (`nmap -sC`).
- **Firewall Bypass Scan**: Attempts to bypass firewalls using fragmentation (`nmap -f`).

---

## Saving Output

- After the scan completes, you can choose to save the output as **XML** or **plaintext**.
- You can also configure the file name for the saved output.

---

## Contributing
If you wish to contribute to the development of AutoCat, feel free to submit a pull request or raise issues. Suggestions for new features and improvements are always welcome!

---

## Contact
**Developer**: Yash Pawar  
**Email**: [yashpawar1199@gmail.com](mailto:yashpawar1199@gmail.com)

If you encounter any issues or have questions, feel free to reach out!

---

