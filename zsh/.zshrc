# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

export ZDOTDIR="$HOME/.config/zsh"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh
# ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
# ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
# ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
# ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
# ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
# ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Loads Zsh's powerful tab-completion system for commands, aliases, and functions
# Example:
#   Type `git` and press `Tab` → Shows available git subcommands
#   Type `cd` and press `Tab` → Shows available directories
autoload -Uz compinit && compinit

# Restores the last working directory when opening a new shell session using Zinit
# The `-q` flag enables quiet mode, suppressing output messages.
zinit cdreplay -q

# Source the prompt configuration
source "${ZDOTDIR}/.zsh_prompt"

# Source the alias configuration
source "${ZDOTDIR}/.zsh_aliases"


# ██╗  ██╗███████╗██╗   ██╗     ██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
# ██║ ██╔╝██╔════╝╚██╗ ██╔╝     ██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
# █████╔╝ █████╗   ╚████╔╝      ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
# ██╔═██╗ ██╔══╝    ╚██╔╝       ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
# ██║  ██╗███████╗   ██║███████╗██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
# ╚═╝  ╚═╝╚══════╝   ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

# Set key binding style to emacs mode (standard key bindings like Ctrl+A, Ctrl+E)
bindkey -e

# Bind Ctrl + P to search backward through command history
bindkey '^p' history-search-backward

# Bind Ctrl + N to search forward through command history
bindkey '^n' history-search-forward

# Bind Alt + W to kill (cut) the region (selected text or from the cursor to the word boundary)
bindkey '^[w' kill-region

# Bind Ctrl + Right Arrow to move the cursor forward one word
bindkey '^[[1;5C' forward-word

# Bind Ctrl + Left Arrow to move the cursor backward one word
bindkey '^[[1;5D' backward-word

# Bind Ctrl + H to delete the previous word (backward delete)
bindkey '^H' backward-delete-word

# Bind Ctrl + Backspace to delete the previous word (delete word backward)
bindkey '^[[3;5~' delete-word

# Zsh
# ██╗  ██╗██╗███████╗████████╗ ██████╗ ██████╗ ██╗   ██╗
# ██║  ██║██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗╚██╗ ██╔╝
# ███████║██║███████╗   ██║   ██║   ██║██████╔╝ ╚████╔╝
# ██╔══██║██║╚════██║   ██║   ██║   ██║██╔══██╗  ╚██╔╝
# ██║  ██║██║███████║   ██║   ╚██████╔╝██║  ██║   ██║
# ╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝

HISTSIZE=5000
HISTFILE=${ZDOTDIR}/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
# setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion
# ███████╗████████╗██╗   ██╗██╗     ██╗███╗   ██╗ ██████╗
# ██╔════╝╚══██╔══╝╚██╗ ██╔╝██║     ██║████╗  ██║██╔════╝
# ███████╗   ██║    ╚████╔╝ ██║     ██║██╔██╗ ██║██║  ███╗
# ╚════██║   ██║     ╚██╔╝  ██║     ██║██║╚██╗██║██║   ██║
# ███████║   ██║      ██║   ███████╗██║██║ ╚████║╚██████╔╝
# ╚══════╝   ╚═╝      ╚═╝   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝

# Matches lowercase letters to their corresponding uppercase letters for tab completion.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Uses the current LS_COLORS for colorizing completion results.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disables the menu mode for completion, making it not show a menu.
zstyle ':completion:*' menu no

# Sets a preview command for `fzf` when completing directories, showing their contents with color.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Sets a preview command for `fzf` when completing zoxide directories, showing their contents with color.
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'



# Shell
# ██╗███╗   ██╗████████╗███████╗ ██████╗ ██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
# ██║████╗  ██║╚══██╔══╝██╔════╝██╔════╝ ██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
# ██║██╔██╗ ██║   ██║   █████╗  ██║  ███╗██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗
# ██║██║╚██╗██║   ██║   ██╔══╝  ██║   ██║██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║
# ██║██║ ╚████║   ██║   ███████╗╚██████╔╝██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║
# ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

# Initializes fzf (fuzzy finder) for use with Zsh, enabling fuzzy search in the terminal.
eval "$(fzf --zsh)"

# Sets up zoxide (fast directory traversal tool) for use with Zsh, improving directory navigation using `cd`.
eval "$(zoxide init --cmd cd zsh)"

