set -x GOPATH $HOME/.go
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $HOME/.bin $HOME/.fzf/bin $HOME/.nodebrew/current/bin $PYENV_ROOT/bin $GOPATH/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /Volumes/crosstoolsng/x-tools/arm-cortexa9_neon-linux-gnueabihf/bin
eval (pyenv init - | source)

alias g=gcd
alias j=jobs
alias l=less
alias lg=lazygit
alias ls=lsd
alias ll='lsd -l'
alias M='history merge'
alias tenki=wego
alias tig='tig --all'
alias tree='lsd --tree'
alias xd='hexdump -C'

function my_command_not_found --on-event fish_command_not_found
    if type figlet > /dev/null 2>&1
        figlet -f starwars "Bad command or file name"
    end
end

starship init fish | source
#source ~/.iterm2_shell_integration.fish
