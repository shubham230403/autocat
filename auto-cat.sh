#!/bin/bash

# AutoCat - Netcat Automation Tool with Nmap Scans
# Created by Yash Pawar
# Contact: yashpawar1199@gmail.com

# ANSI color codes for colorful fonts
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
NC='\033[0m' # No Color

# Function to display ASCII art banner
display_banner() {
    clear
    echo -e "${YELLOW}"
    echo "   █████╗ ██╗   ██╗████████╗ ██████╗  ██████╗ █████╗ ████████╗"
    echo "  ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝██╔══██╗╚══██╔══╝"
    echo "  ███████║██║   ██║   ██║   ██║   ██║██║     ███████║   ██║   "
    echo "  ██╔══██║██║   ██║   ██║   ██║   ██║██║     ██╔══██║   ██║   "
    echo "  ██║  ██║╚██████╔╝   ██║   ╚██████╔╝╚██████╗██║  ██║   ██║   "
    echo -e "${PURPLE}                 Created by Yash Pawar${NC}"
    echo
    echo -e "${CYAN}==============================================="
    echo " Welcome to Hackers Paradise - AutoCat Tool"
    echo " A versatile and easy-to-use netcat automation"
    echo " tool with integrated nmap scans."
    echo " Contact: yashpawar1199@gmail.com"
    echo "===============================================${NC}"
    echo
}

# Function to display help
display_help() {
    echo -e "${CYAN}AutoCat - Netcat & Nmap Automation Tool${NC}"
    echo "Usage: ./auto-cat.sh [OPTIONS]"
    echo
    echo "Options:"
    echo -e "  ${GREEN}--help${NC}       Show this help message and exit"
    echo -e "  ${GREEN}1${NC}            Port scanning using Nmap"
    echo -e "  ${GREEN}2${NC}            Set up a Netcat listener"
    echo -e "  ${GREEN}3${NC}            Connect to a Netcat listener"
    echo -e "  ${GREEN}4${NC}            Transfer files using Netcat"
    echo -e "  ${GREEN}5${NC}            Exit the tool"
    echo
}

# Function to display menu
display_menu() {
    echo -e "${GREEN}Netcat & Nmap Automation Menu:${NC}"
    echo -e "${YELLOW}-----------------------------${NC}"
    echo -e "1. ${BLUE}Nmap Scans${NC}"
    echo -e "2. ${BLUE}Set up a Netcat Listener${NC}"
    echo -e "3. ${BLUE}Connect to a Netcat Listener${NC}"
    echo -e "4. ${BLUE}Transfer Files with Netcat${NC}"
    echo -e "5. ${RED}Exit${NC}"
}

# Function to perform Nmap scans
nmap_scans() {
    read -p "Enter target IP or domain: " target
    read -p "Enter port(s) to scan (e.g., 80,443 or 1-1000): " ports

    echo -e "${CYAN}Choose the type of scan:${NC}"
    echo "1. Aggressive Scan"
    echo "2. Stealth Scan (SYN)"
    echo "3. Script Scan"
    echo "4. Firewall Bypass Scan"
    read -p "Your choice: " scan_choice

    case $scan_choice in
        1) 
            echo -e "${CYAN}Performing Aggressive Scan on $target...${NC}"
            scan_command="nmap -A -p $ports $target"
            ;;
        2)
            echo -e "${CYAN}Performing Stealth Scan (SYN) on $target...${NC}"
            scan_command="nmap -sS -p $ports $target"
            ;;
        3)
            echo -e "${CYAN}Performing Script Scan on $target...${NC}"
            scan_command="nmap -sC -p $ports $target"
            ;;
        4)
            echo -e "${CYAN}Performing Firewall Bypass Scan on $target...${NC}"
            scan_command="nmap -f -p $ports $target"
            ;;
        *)
            echo -e "${RED}Invalid choice! Returning to main menu.${NC}"
            return
            ;;
    esac

    # Execute the chosen scan
    echo -e "${GREEN}Executing: $scan_command${NC}"
    scan_output=$($scan_command)
    echo -e "${GREEN}Scan Complete!${NC}"

    # Display output
    echo -e "${BLUE}===== Scan Output =====${NC}"
    echo "$scan_output"
    echo -e "${BLUE}========================${NC}"

    # Ask the user if they want to save the output
    read -p "Do you want to save the output? (y/n): " save_output
    if [[ $save_output == "y" ]]; then
        read -p "Enter file format (xml or txt): " file_format
        read -p "Enter file name (without extension): " file_name
        file_path="$file_name.$file_format"
        
        if [[ $file_format == "xml" ]]; then
            $scan_command -oX "$file_path"
        else
            $scan_command -oN "$file_path"
        fi

        echo -e "${GREEN}Output saved to $file_path${NC}"
    fi
}

# Function to set up a Netcat listener
setup_listener() {
    read -p "Enter port to listen on: " port
    echo -e "${CYAN}Setting up listener on port $port...${NC}"
    nc -lvnp $port
}

# Function to connect to a Netcat listener
connect_listener() {
    read -p "Enter listener IP: " listener_ip
    read -p "Enter listener port: " port
    echo -e "${CYAN}Connecting to $listener_ip on port $port...${NC}"
    nc $listener_ip $port
}

# Function to transfer files using Netcat
transfer_files() {
    echo -e "${GREEN}1. ${CYAN}Send a File${NC}"
    echo -e "${GREEN}2. ${CYAN}Receive a File${NC}"
    read -p "Choose option: " transfer_option

    if [[ $transfer_option -eq 1 ]]; then
        read -p "Enter target IP: " target_ip
        read -p "Enter target port: " port
        read -p "Enter the file to send: " file_path
        echo -e "${CYAN}Sending $file_path to $target_ip on port $port...${NC}"
        cat $file_path | nc $target_ip $port
    elif [[ $transfer_option -eq 2 ]]; then
        read -p "Enter port to receive on: " port
        read -p "Enter the file name to save as: " file_name
        echo -e "${CYAN}Listening on port $port to receive file...${NC}"
        nc -lvnp $port > $file_name
    else
        echo -e "${RED}Invalid option!${NC}"
    fi
}

# Main logic to display banner, menu, and execute selected options
if [[ $1 == "--help" ]]; then
    display_help
    exit 0
fi

while true; do
    display_banner
    display_menu
    read -p "Choose an option: " choice
    case $choice in
        1)
            nmap_scans
            ;;
        2)
            setup_listener
            ;;
        3)
            connect_listener
            ;;
        4)
            transfer_files
            ;;
        5)
            echo -e "${RED}Exiting the tool. Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice, please try again.${NC}"
            ;;
    esac
done
