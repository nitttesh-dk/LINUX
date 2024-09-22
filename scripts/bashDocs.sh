# Add this to your .bashrc or .zshrc
bash--use() {
    # Color codes
    BRIGHT_YELLOW="\033[1;33m"
    BRIGHT_ORANGE="\033[38;5;208m"
    BRIGHT_PINK="\033[1;35m"
    BRIGHT_BLUE="\033[1;34m"
    BRIGHT_GREEN="\033[1;32m"
    RESET="\033[0m"

    echo -e "${BRIGHT_YELLOW}User Documentation for Shell Configuration${RESET}"
    echo -e "${BRIGHT_YELLOW}--------------------------------------------------${RESET}"
    echo ""

    echo -e "${BRIGHT_ORANGE}Aliases:${RESET}"
    echo -e "  ${BRIGHT_PINK}code${RESET}: Open Visual Studio Code directly from the terminal."
    echo -e "  ${BRIGHT_PINK}code-i${RESET}: Open Visual Studio Code Insiders directly from the terminal."
    echo -e "  ${BRIGHT_PINK}rm${RESET}: Prompt before removing files."
    echo -e "  ${BRIGHT_PINK}cp${RESET}: Prompt before copying files."
    echo -e "  ${BRIGHT_PINK}mv${RESET}: Prompt before moving files."
    echo -e "  ${BRIGHT_PINK}ls${RESET}: Use eza with custom options for a more informative directory listing."
    echo ""

    echo -e "${BRIGHT_ORANGE}Functions to tun languages:${RESET}"
    echo -e "  ${BRIGHT_PINK}runpy ${RESET}<script>: Run Python scripts with nodemon."
    echo -e "  ${BRIGHT_PINK}runjs ${RESET}<script>: Run Node.js scripts with nodemon."
    echo -e "  ${BRIGHT_PINK}runjava ${RESET}<class>: Compile and run Java programs with nodemon."
    echo -e "  ${BRIGHT_PINK}runcpp ${RESET}<file>: Compile and run C++ programs with nodemon."
    echo ""



    echo -e "${BRIGHT_ORANGE}Additional Scripts:${RESET}"
    echo -e "  ${BRIGHT_PINK}setup-rt${RESET}: Sets up Vite, React, and Tailwind CSS in a specified folder or a default folder."
    echo -e "    - Usage: ${BRIGHT_PINK}setup-rt [folder_name]${RESET}"
    echo -e "    - Creates a new Vite project with React and Tailwind CSS, removing default files and setting up Tailwind."
    echo -e "    - Generates a basic App component with default styling."
    echo ""

    echo -e "  ${BRIGHT_PINK}pkgs--use${RESET}: Usage guide for package managers pip, npm, and dnf."
    echo -e "    - Lists installation, uninstallation, and listing commands for each package manager."
    echo ""


}
