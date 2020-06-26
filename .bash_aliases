# global
alias ls='ls --color'
alias vim='nvim'

# digitalocean
alias doctl='docker run --rm -e DIGITALOCEAN_ACCESS_TOKEN="$(secret-tool lookup digitalocean token)" doctl'

# kubernetes
alias kubectl="kubectl --cache-dir ${XDG_CACHE_HOME}/kubernetes/http-cache"

# docker
alias docker-tags='_docker_tags(){ repository=$(echo $1 | grep -Po ".*(?=/)" || echo library); image=$(echo $1 | cut -d'\''/'\'' -f2 || echo $1); curl -s https://registry.hub.docker.com/v2/repositories/${repository}/${image}/tags/?page_size=1024 | jq '\''."results"[]["name"]'\''; }; _docker_tags'

# weather
alias weather='curl wttr.in/~"London"'

# docker tools
alias sslscan='docker run --rm packetsolutions/sslscan'
alias minicom='docker run --rm -it --network none --device=/dev/ttyUSB0:/dev/minicom packetsolutions/minicom'

# git
alias git-check-history='git diff-tree --check $(git hash-object -t tree /dev/null) HEAD'
alias git-branch-clean='git branch --merged | grep -vE "\*|master" | xargs -r git branch -d'
alias git-log-graph='git log --all --oneline --graph --decorate'
alias gc='git checkout'
alias gf='git fetch'

# i3
alias hollywood='docker run --rm -it jturpin/hollywood hollywood'
alias vol='pkill -RTMIN+1 i3blocks && pactl set-sink-volume 1'
alias ssh='TERM=xterm-256color ssh'

# dunst
alias dunst-pause="notify-send 'DUNST_COMMAND_PAUSE'"
alias dunst-resume="notify-send 'DUNST_COMMAND_RESUME'"
alias dunst-disable="killall -SIGUSR1 dunst"
alias dunst-enable="killall -SIGUSR2 dunst"

# gpg
alias gpg-unlock='gpg --decrypt ~/.gnupg/gpg-passphrase.enc.gpg > /dev/null 2>&1 && gpg --decrypt ~/.gnupg/gpg-passphrase.enc.gpg 2>/dev/null | openssl enc -d -aes-256-cbc -pbkdf2 -iter 20000 2>&1 | grep -v "bad decrypt" | grep -v "Binary file" | xargs -r -n 1 -I {} sh -c "echo test | gpg --pinentry-mode loopback --batch --clearsign --passphrase {} >/dev/null && echo GPG Key Loaded"'
alias gpg-clear='gpg-connect-agent reloadagent /bye'

# dotfiles
alias dotfiles='pkill -RTMIN+7 i3blocks && /usr/bin/git --git-dir=$HOME/.local/share/dotfiles/ --work-tree=$HOME'
