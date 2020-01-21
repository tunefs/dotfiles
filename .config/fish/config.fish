set -x GOPATH $HOME/.go
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $HOME/.bin $HOME/.fzf/bin $HOME/.nodebrew/current/bin $PYENV_ROOT/bin $GOPATH/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /Volumes/crosstoolsng/x-tools/arm-cortexa9_neon-linux-gnueabihf/bin
eval (pyenv init - | source)

alias g=gcd
alias j=jobs
alias l=less
alias tig='tig --all'
alias xd='hexdump -C'

starship init fish | source
