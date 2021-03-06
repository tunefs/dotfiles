set -x EDITOR vi
# set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'
# set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'
set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border'
set -x FZF_CTRL_T_OPTS '--preview "bat --color=always --line-range :80 {}"'
set -x FZF_TMUX 1
set -x GOPATH $HOME/.go
set -x LANG en_US.UTF-8
set -x LESS iMQRsX
set -x LESSCHARSET utf-8
set -x NVIM_LISTEN_ADDRESS $HOME/.vim/tmp/nvimsocket
set -x PAGER less
set -x PYENV_ROOT $HOME/.pyenv

switch (arch) 
    case 'i386*'
        set -x HOMEBREW /usr/local
	set -x PATH $HOME/.bin $PYENV_ROOT/bin $GOPATH/bin $HOMEBREW/sbin $HOMEBREW/bin /usr/sbin /usr/bin /sbin /bin
    case 'arm*'
        set -x HOMEBREW /opt/homebrew
	set -x PATH $HOME/.bin $PYENV_ROOT/bin $GOPATH/bin $HOMEBREW/sbin $HOMEBREW/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
end

pyenv init --path | source
pyenv init - | source
eval (nodenv init - | source)
zoxide init fish | source

ulimit -S -n 2048

alias b=bcd
alias g=gcd
alias j=jobs
alias l=less
alias lg=lazygit
alias ls='exa -F'
alias ll='exa -Fl'
#alias lll='lsd -FlL'
alias M='history merge'
alias tenki=wego
#alias tig='tig --all'
alias tree='exa -F --tree'
alias typora='open -a typora'
alias v='gvim --remote-silent'
alias xd='hexdump -C'

function my_command_not_found --on-event fish_command_not_found
    if type figlet > /dev/null 2>&1
        figlet -f cyberlarge "Bad command or file name"
    end
end

starship init fish | source
#source ~/.iterm2_shell_integration.fish
