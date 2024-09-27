# Add this to your .bashrc or .zshrc
pkgs--use() {
    # Color codes
    CREAM="\033[38;5;230m"
    ORANGE="\033[38;5;208m"
    PINK="\033[35m"
    RESET="\033[0m"

    echo -e "${CREAM}Usage guide for pip, npm, brew, and apt package managers${RESET}"
    echo -e "${CREAM}---------------------------------------------------${RESET}"
    echo ""
    echo -e "${ORANGE}1. pip (Python package manager):${RESET}"
    echo -e "   Install:       ${PINK}pip3 install <package_name>${RESET}"
    echo -e "   Uninstall:     ${PINK}pip3 uninstall <package_name>${RESET}"
    echo -e "   Search:        ${PINK}pip3 search <package_name>${RESET}"
    echo -e "   List:          ${PINK}pip3 list${RESET} or ${PINK}pip-pkgs${RESET} (for colorful list)"
    echo ""
    echo -e "${ORANGE}2. npm (Node.js package manager):${RESET}"
    echo -e "   Install globally:   ${PINK}npm install -g <package_name>${RESET}"
    echo -e "   Install locally:    ${PINK}npm install <package_name>${RESET}"
    echo -e "   Uninstall globally: ${PINK}npm uninstall -g <package_name>${RESET}"
    echo -e "   Uninstall locally:  ${PINK}npm uninstall <package_name>${RESET}"
    echo -e "   Search:             ${PINK}npm search <package_name>${RESET}"
    echo -e "   List globally:      ${PINK}npm list -g${RESET} or ${PINK}npm-pkgs${RESET} (for colorful list)"
    echo ""
    echo -e "${ORANGE}3. brew (Homebrew package manager):${RESET}"
    echo -e "   Install:       ${PINK}brew install <package_name>${RESET}"
    echo -e "   Uninstall:     ${PINK}brew uninstall <package_name>${RESET}"
    echo -e "   Search:        ${PINK}brew search <package_name>${RESET}"
    echo -e "   List:          ${PINK}brew list${RESET} or ${PINK}brew-pkgs${RESET} (for colorful list)"
    echo ""
    echo -e "${ORANGE}4. apt (Debian/Ubuntu package manager):${RESET}"
    echo -e "   Install:       ${PINK}sudo apt install <package_name>${RESET}"
    echo -e "   Uninstall:     ${PINK}sudo apt remove <package_name>${RESET}"
    echo -e "   Search:        ${PINK}apt search <package_name>${RESET}"
    echo -e "   List:          ${PINK}apt list --installed${RESET} or ${PINK}apt-pkgs${RESET} (for colorful list)"
    echo ""
    echo -e "${CREAM}---------------------------------------------------${RESET}"
    echo -e "Replace ${PINK}<package_name>${RESET} with the actual package name."
    echo ""
    echo -e "${CREAM}To see all pages of all package managers, use: ${PINK}all-pkgs${RESET}"
}

# Sub-function for pip packages
pip-pkgs() {
    local PINK='\033[1;35m'         # Pink (list items)
    local CYAN='\033[0;36m'         # Cyan (versions)
    local RESET='\033[0m'           # Reset to default

    echo -e "\033[1;4;33mPython Packages (pip):\033[0m"  # Bold and underlined Yellow heading
    pip3 list --format=freeze | awk -v pink="$PINK" -v cyan="$CYAN" -v reset="$RESET" \
        '{split($0, pkg, "=="); printf pink "  - %-40s" cyan " %-20s" reset "\n", pkg[1], pkg[2]}'
}


# Sub-function for npm packages
npm-pkgs() {
    local PINK='\033[1;35m'         # Pink (list items)
    local CYAN='\033[0;36m'         # Cyan (versions)
    local RESET='\033[0m'           # Reset to default

    echo -e "\033[1;4;33mGlobal NPM Packages:\033[0m"  # Bold and underlined Yellow heading
    npm list -g --depth=0 | grep '└──' | awk -v pink="$PINK" -v cyan="$CYAN" -v reset="$RESET" \
        '{split($0, pkg, " "); printf pink "  - %-40s" cyan " %-20s" reset "\n", pkg[2], pkg[3]}'
}


# Sub-function for brew packages
brew-pkgs() {
    local PINK='\033[1;35m'         # Pink (list items)
    local CYAN='\033[0;36m'         # Cyan (versions)
    local RESET='\033[0m'           # Reset to default

    echo -e "\033[1;4;33mHomebrew Packages:\033[0m"  # Bold and underlined Yellow heading
    brew list --versions | awk -v pink="$PINK" -v cyan="$CYAN" -v reset="$RESET" \
        '{printf pink "  - %-40s" cyan " %-20s" reset "\n", $1, $2}'
}

# Sub-function for apt packages
apt-pkgs() {
    local PINK='\033[1;35m'         # Pink (list items)
    local CYAN='\033[0;36m'         # Cyan (versions)
    local RESET='\033[0m'           # Reset to default

    echo -e "\033[1;4;33mInstalled APT Packages:\033[0m"  # Bold and underlined Yellow heading
    dpkg-query -W -f='${binary:Package} ${Version}\n' | awk -v pink="$PINK" -v cyan="$CYAN" -v reset="$RESET" \
        '{printf pink "  - %-40s" cyan " %-20s" reset "\n", $1, $2}'
}

# Main function that calls the sub-functions
all-pkgs() {
    brew-pkgs
    echo -e "\n"
    pip-pkgs
    echo -e "\n"
    npm-pkgs
}
