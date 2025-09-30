#!/bin/bash
#RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ===== Functions =====

system_health() {
    echo -e "${YELLOW}Generating system report...${NC}"
    {
        echo "Disk Usage:"
        df -h
        echo ""
        echo "CPU Info:"
        lscpu
        echo ""
        echo "Memory Usage:"
        free -h
    } > system_report.txt
    echo -e "${GREEN}First 10 lines of system_report.txt:${NC}"
    head -n 10 system_report.txt
}

active_processes() {
    ps aux
    read -p "Enter keyword to filter: " keyword
    matches=$(ps aux | grep -i "$keyword" | grep -v "grep")
    echo "$matches"
    echo "Total matches: $(echo "$matches" | wc -l)"
}

user_group_mgmt() {
    read -p "Enter new username: " uname
    sudo adduser "$uname"
    sudo passwd "$uname"
    read -p "Enter new group name: " gname
    sudo groupadd "$gname"
    sudo usermod -aG "$gname" "$uname"
    touch testfile.txt
    sudo chown "$uname":"$gname" testfile.txt
    echo -e "${GREEN}User, group, and ownership updated!${NC}"
}

file_organizer() {
    read -p "Enter directory path: " dir
    if [ -d "$dir" ]; then
        mkdir -p "$dir/images" "$dir/docs" "$dir/scripts"
        mv "$dir"/*.jpg "$dir/images/" 2>/dev/null
        mv "$dir"/*.png "$dir/images/" 2>/dev/null
        mv "$dir"/*.txt "$dir/docs/" 2>/dev/null
        mv "$dir"/*.md "$dir/docs/" 2>/dev/null
        mv "$dir"/*.sh "$dir/scripts/" 2>/dev/null
        tree "$dir"
    else
        echo -e "${RED}Directory does not exist!${NC}"
    fi
}

network_diag() {
    echo "Pinging google.com..."
    ping -c 3 google.com
    echo "DNS lookup google.com..."
    dig google.com
    echo "Fetching headers from example.com..."
    curl -I https://example.com
} > network_report.txt

schedule_task() {
    read -p "Enter script path: " script
    read -p "Enter minute (0-59): " m
    read -p "Enter hour (0-23): " h
    (crontab -l; echo "$m $h * * * $script") | crontab -
    echo -e "${GREEN}Cron job scheduled!${NC}"
}

ssh_key_setup() {
    ssh-keygen -t rsa -b 4096
    echo -e "${YELLOW}Your public key:${NC}"
    cat ~/.ssh/id_rsa.pub
    echo "Copy it to remote server using:"
    echo "ssh-copy-id user@remote_host"
}

# ===== Menu =====
while true; do
    echo -e "\n${YELLOW}==== Main Menu ====${NC}"
    echo "1. System Health Check"
    echo "2. Active Processes"
    echo "3. User & Group Management"
    echo "4. File Organizer"
    echo "5. Network Diagnostics"
    echo "6. Scheduled Task Setup"
    echo "7. SSH Key Setup"
    echo "8. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1) system_health ;;
        2) active_processes ;;
        3) user_group_mgmt ;;
        4) file_organizer ;;
        5) network_diag ;;
        6) schedule_task ;;
        7) ssh_key_setup ;;
        8) echo -e "${GREEN}Goodbye!${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid choice!${NC}" ;;
    esac
done
