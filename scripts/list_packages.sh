# Add this to your .bashrc or .zshrc
pkgs--use() {
    # Color codes
    CREAM="\033[38;5;230m"
    ORANGE="\033[38;5;208m"
    PINK="\033[35m"
    RESET="\033[0m"

    echo -e "${CREAM}Usage guide for pip, npm, and dnf package managers${RESET}"
    echo -e "${CREAM}---------------------------------------------------${RESET}"
    echo ""
    echo -e "${ORANGE}1. pip (Python package manager):${RESET}"
    echo -e "   Install:       ${PINK}pip install <package_name>${RESET}"
    echo -e "   Uninstall:     ${PINK}pip uninstall <package_name>${RESET}"
    echo -e "   Search:        ${PINK}pip search <package_name>${RESET}"
    echo -e "   List:          ${PINK}pip list${RESET} or ${PINK}pip-pkgs${RESET} (for colorful list)"
    echo ""
    echo -e "${ORANGE}2. npm (Node.js package manager):${RESET}"
    echo -e "   Install globally:   ${PINK}npm install -g <package_name>${RESET}"
    echo -e "   Install locally:    ${PINK}npm install <package_name>${RESET}"
    echo -e "   Uninstall globally: ${PINK}npm uninstall -g <package_name>${RESET}"
    echo -e "   Uninstall locally:  ${PINK}npm uninstall <package_name>${RESET}"
    echo -e "   Search:             ${PINK}npm search <package_name>${RESET}"
    echo -e "   List globally:      ${PINK}npm list -g${RESET} or ${PINK}npm-pkgs${RESET} (for colorful list)"
    echo ""
    echo -e "${ORANGE}3. dnf (Fedora package manager):${RESET}"
    echo -e "   Install:       ${PINK}sudo dnf install <package_name>${RESET}"
    echo -e "   Uninstall:     ${PINK}sudo dnf remove <package_name>${RESET}"
    echo -e "   Search:        ${PINK}sudo dnf search <package_name>${RESET}"
    echo -e "   List:          ${PINK}dnf list installed${RESET} or ${PINK}dnf-pkgs${RESET} (for colorful list)"
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
    pip list --format=freeze | awk -v pink="$PINK" -v cyan="$CYAN" -v reset="$RESET" \
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

# Sub-function for dnf packages
dnf-pkgs() {
    local PINK='\033[1;35m'         # Pink (list items)
    local CYAN='\033[0;36m'         # Cyan (versions and sizes)
    local RESET='\033[0m'           # Reset to default

    echo -e "\033[1;4;33mUser Installed RPM Packages (dnf):\033[0m"  # Bold and underlined Yellow heading
    dnf repoquery --userinstalled --qf "%{name}-%{version}-%{release}.%{arch}  %{size} " \
        | awk -v pink="$PINK" -v cyan="$CYAN" -v reset="$RESET" \
        '{printf pink "  - %-40s" cyan " %-20s %10s MB\n" reset, $1, $3, sprintf("%.2f", $2 / 1048576)}' \
        | sort
}

# Main function that calls the sub-functions
all-pkgs() {
    dnf-pkgs
    echo -e "\n"
    pip-pkgs
    echo -e "\n"
    npm-pkgs
}
