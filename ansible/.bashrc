# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Source svpb-venv, if it exists
[ -f /home/svpb/svpb-venv/bin/activate ] && . /home/svpb/svpb-venv/bin/activate

# Enable history-based/prefix-based completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Aliases
## Standard system tool aliases
alias la='ls -A'
alias ll='ls -Alh'

## git aliases
alias ga='git add'
alias gapa='git add --patch'
alias gan='git add --intent-to-add'

alias gcl='git clone'
alias gc='git commit -v'
alias gco='git checkout'

alias gd='git diff'
alias gdcw='git diff --cached --word-diff'
alias gdw='git diff --word-diff'
alias gds='git diff --staged'

alias glo="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

alias gl='git pull'
alias gp='git push'

alias gst='git status'
