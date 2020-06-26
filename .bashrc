# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
HISTTIMEFORMAT='%Y-%m-%dT%H:%M:%S%z  '

# xdg specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# gpg
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

# kubernetes
export KUBECONFIG="${XDG_CONFIG_HOME}/kubernetes/config"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# configure ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "${XDG_RUNTIME_DIR}/.ssh-agent"
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<${XDG_RUNTIME_DIR}/.ssh-agent)"
fi

if [ -f  /usr/share/bash-completion/bash_completion ]; then
  .  /usr/share/bash-completion/bash_completion
fi

# completion
complete -C '/usr/bin/aws_completer' aws
source /usr/share/bash-completion/completions/git
complete -o default -o nospace -F _git dotfiles

PROMPT_COMMAND='LAST_STATUS=$?; history -a'
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  . /usr/share/git/completion/git-prompt.sh
  PS1='\[\e[1;36m\]\t \[\e[1;34m\]\W$([[ $(__git_ps1 "%s") == master ]] && echo "\[\e[1;31m\]" || echo "\[\e[1;37m\]")$(__git_ps1) $([[ $LAST_STATUS = 0 ]] && echo "\[\e[32m\]" || echo "\[\e[31m\]")=>\[\e[0m\] '
else
  PS1='\[\e[1;36m\]\t \[\e[1;34m\]\W $([[ $LAST_STATUS = 0 ]] && echo "\[\e[32m\]" || echo "\[\e[31m\]")=>\[\e[0m\] '
fi
