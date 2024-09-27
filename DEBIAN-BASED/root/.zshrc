
# +++++++++++++++++++++++++++++++++++++++++
# Path to your Oh My Zsh installation.
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME_RANDOM_CANDIDATES=( "norm" "junkfood" "jtriley" "jonathan" "itchy" )
# ZSH_THEME_RANDOM_CANDIDATES=(  "junkfood"  "jonathan"  )
ZSH_THEME="jonathan"
source "$ZSH/oh-my-zsh.sh" 


plugins=(git)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export EDITOR="code-insiders"
export VISUAL="code-insiders"

# Import all scripts from /root/.scripts
for script in ~/.scripts/*.sh; do
  if [[ -f "$script" ]]; then
    source "$script"
  fi
done





# ---- LANGUAGES CONFIGURATION ----

# Color codes for output messages
RED='\033[0;31m'      # Red color
VIOLET='\033[0;35m'   # Violet (dark purple) color
BLUE='\033[0;34m'     # Blue color
PINK='\033[1;35m'     # Pink color
NC='\033[0m'          # No color (reset)


# Function to run Python scripts with nodemon
function runpy() {
  nodemon --exec "$HOME/.run_with_clear.sh" -- "${PINK}Python script is running on ADMIN${NC}" python3 "$@"
}

# Function to run Node.js scripts with nodemon
function runjs() {
  nodemon --exec "$HOME/.run_with_clear.sh" -- "${RED}JS script is running on ADMIN${NC}" node "$@"
}

# Function to compile and run Java programs with nodemon
function runjava() {
  nodemon --exec "$HOME/.run_with_clear.sh" -- "${VIOLET}Java program is running on ADMIN${NC}" java "$1"
}

# Function to compile and run C++ programs with nodemon
function runcpp() {
  nodemon --ext cpp --exec "$HOME/.run_with_clear.sh" -- "${BLUE}C++ program is running on ADMIN${NC}" "g++ $1 -o ${1%.cpp} && ./${1%.cpp}"
}





# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

