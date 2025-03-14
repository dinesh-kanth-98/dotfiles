alias c=clear
alias p=pwd
alias e=exit
alias ipd='ifconfig'
alias r='cd -'
alias ..='cd ..'
alias pi="ps -e | grep -i $1"
alias inf="ls -lFh | grep -i $1"

if command -v exa &> /dev/null; then
    alias l1='exa -Flh --tree --level=2'
    alias l2='exa -Flh --tree --level=3'

    alias ls='exa -F --color=always --icons'
    alias lsa='exa -Fa --color=always --icons'

    alias ll='exa -Flh --color=always --icons'
    alias lla='exa -Flah --color=always --icons'

    alias llg='exa -Flh --color=always --icons --group-directories-first'
    alias llga='exa -Flah --color=always --icons --group-directories-first'

    alias llt='exa -Flh --color=always --icons  --sort modified'
    alias llta='exa -Flah --color=always --icons  --sort modified'
else
    alias ls='ls -F'
    alias lsa='ls -aF'

    alias ll='ls -lhF'
    alias lla='ls -alhF'

    alias llt='ls -hlFtr'
    alias llta='ls -halFtr'
fi

# Check if 'code' command exists once
if command -v code >/dev/null 2>&1; then
    # If 'code' exists, use it in aliases
    alias OA='(code ~/.bash_aliases & ) > /dev/null 2>&1'
    alias OB='(code ~/.bashrc & ) > /dev/null 2>&1'
    alias OBP='(code ~/.bash_profile & ) > /dev/null 2>&1'
else
    # If 'code' does not exist, fall back to vim
    alias OA='(vim ~/.bash_aliases)'
    alias OB='(vim ~/.bashrc)'
    alias OBP='(vim ~/.bash_profile)'
fi

alias KF='pkill firefox'
alias BR='source ~/.bashrc'
alias nb='( jupyter notebook & ) > /dev/null 2>&1'
alias py="python3.11 $@"
alias gss="git status"
alias AF="alias | grep -i $1"
