set -x HOMEBREW_NO_INSTALL_CLEANUP 1
set -x EDITOR vi
#set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border
#    --color=light
#    --color=fg:#4d4d4c,hl:#d7005f
#    --color=fg+:#4d4d4c,hl+:#d7005f
#    --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f
#    --color=marker:#4271ae,spinner:#4271ae,header:#4271ae'
#set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border --color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'
set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border --color=dark --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
#set -x FZF_DEFAULT_OPTS '--cycle --no-mouse --inline-info --border --color=dark'
set -x FZF_CTRL_T_OPTS '--preview "bat --color=always --line-range :80 {}"'
#set -x FZF_TMUX 1
#set -x GOPATH $HOME/.go
# set -x GNUARMEMB_TOOLCHAIN_PATH /opt/homebrew
set -x GNUARMEMB_TOOLCHAIN_PATH /Applications/ARM
# set -x GNUARMEMB_TOOLCHAIN_PATH $HOME/.local/opt/zephyr-sdk-0.16.1/arm-zephyr-eabi
set -x LANG en_US.UTF-8
set -x LESS iMQRsX
set -x LESSCHARSET utf-8
set -x PAGER bat
set -x PYENV_ROOT $HOME/.pyenv
set -x ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb

switch (arch)
    case 'i386*'
        set -x HOMEBREW /usr/local
        set -x PATH $HOME/.bin $HOME/.local/bin $HOMEBREW/sbin $HOMEBREW/bin /usr/sbin /usr/bin /sbin /bin $HOME/.fig/bin $GNUARMEMB_TOOLCHAIN_PATH/bin
    case 'arm*'
        set -x HOMEBREW /opt/homebrew
        set -x PATH $HOME/.bin $HOME/.local/bin $HOMEBREW/sbin $HOMEBREW/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin $HOME/.fig/bin $GNUARMEMB_TOOLCHAIN_PATH/bin
end

#eval (gdircolors -c)
pyenv init --path | source
pyenv init - | source
eval (nodenv init - | source)
zoxide init fish | source

ulimit -S -n 2048

#alias b=bcd
#alias docker='lima nerdctl'
alias b=gbr
alias df='df -h'
alias du='du -h'
alias g=gcd
alias gu=gitui
alias j=jobs
alias l=less
alias ls='lsd -F'
alias ll='lsd -Fl'
alias llb='lsd -Fl --size bytes'
#alias llt='exa -Fl --sort=date --icons'
alias lll='lsd -FlL'
alias M='history merge'
alias t='tig --all'
alias tree='lsd -F --tree'
alias u=bcd
alias xd=hexyl

function fish_greeting
    if type -q fortune; type -q cowsay; and type -q lolcat
        fortune | cowsay -f $HOME/.config/cowsay/genba.cow | lolcat
    else
        echo "Welcome."
    end
end

function fish_command_not_found
    if type -q cowsay; and type -q lolcat
        cowsay -f $HOME/.config/cowsay/genba.cow "Bad command or file name: $argv[1]" | lolcat
    end
end

starship init fish | source
#source ~/.iterm2_shell_integration.fish

#function github-copilot_helper
#    set -l TMPFILE (mktemp)
#    trap 'rm -f $TMPFILE' EXIT
#    if github-copilot-cli $argv[1] "$argv[2..]" --shellout $TMPFILE
#        if [ -e "$TMPFILE" ]
#            set -l FIXED_CMD (cat $TMPFILE)
#            eval "$FIXED_CMD"
#        else
#            echo "Apologies! Extracting command failed"
#        end
#    else
#        return 1
#    end
#end
##alias ??='github-copilot_helper what-the-shell'
#alias sh?='github-copilot_helper what-the-shell'
#alias git?='github-copilot_helper git-assist'
#alias gh?='github-copilot_helper gh-assist'

# vim: set expandtab shiftwidth=4:
