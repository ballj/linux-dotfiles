if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export EDITOR='/usr/bin/nvim'
export TERMINAL='/usr/bin/urxvt'
export NO_AT_BRIDGE=1

if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = /dev/tty1 ]]; then
  exec startx; exit
fi
