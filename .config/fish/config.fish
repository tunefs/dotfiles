set -x EDITOR vi
#set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border
#    --color=light
#    --color=fg:#4d4d4c,hl:#d7005f
#    --color=fg+:#4d4d4c,hl+:#d7005f
#    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
#    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'
set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border
    --color=dark
    --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
    --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
#set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border --color=dark'
set -x FZF_CTRL_T_OPTS '--preview "bat --color=always --line-range :80 {}"'
#set -x FZF_TMUX 1
#set -x GOPATH $HOME/.go
# set -x GNUARMEMB_TOOLCHAIN_PATH /Applications/ARM
set -x GNUARMEMB_TOOLCHAIN_PATH $HOME/Library/xPacks/@xpack-dev-tools/arm-none-eabi-gcc/10.3.1-2.3.1/.content
set -x LANG en_US.UTF-8
set -x LESS iMQRsX
set -x LESSCHARSET utf-8
set -x NVIM_LISTEN_ADDRESS $HOME/.vim/tmp/nvimsocket
set -x PAGER bat
set -x PYENV_ROOT $HOME/.pyenv
set -x ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb

switch (arch) 
    case 'i386*'
        set -x HOMEBREW /usr/local
	set -x PATH $HOME/.bin $HOMEBREW/sbin $HOMEBREW/bin /usr/sbin /usr/bin /sbin /bin
    case 'arm*'
        set -x HOMEBREW /opt/homebrew
	set -x PATH $HOME/.bin $HOMEBREW/sbin $HOMEBREW/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
end

eval (gdircolors -c)
pyenv init --path | source
pyenv init - | source
eval (nodenv init - | source)
zoxide init fish | source

ulimit -S -n 2048

#alias b=bcd
#alias docker='lima nerdctl'
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
alias v='gvim --remote-silent'
alias xd=hexyl

function fish_command_not_found
    if type figlet > /dev/null 2>&1
        figlet -f cyberlarge "Bad command or file name"
    end
end

starship init fish | source
#source ~/.iterm2_shell_integration.fish
