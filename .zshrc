umask 022

# function zle-line-init zle-keymap-select {
# 	VIM_NORMAL="%F{2}[%30<...<%~%<<]%f"
# 	VIM_INSERT="%F{4}[%30<...<%~%<<]%f"
# 	PROMPT="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}%B%#%b "
# 	zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

CDPATH=.:$HOME
HISTFILE=$HOME/.zshhist
HISTSIZE=1000000
MAILPATH=/var/mail/$USER
READNULLCMD=less
SAVEHIST=1000000
WORDCHARS=${WORDCHARS//[\-\/.]}

fpath=($HOME/.ghq/github.com/mollifier/anyframe(N-/) $fpath)

unlimit

setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_REMOVE_SLASH
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt LIST_PACKED
setopt PRINT_EIGHT_BIT
setopt PUSHD_IGNORE_DUPS
setopt RM_STAR_SILENT
setopt SHARE_HISTORY

setopt NO_BG_NICE
setopt NO_PROMPT_CR

alias a=alias
alias back='cd -'
# alias c='echo -n "\033[999;1H\033[2J"'
# alias c='pygmentize -O encoding=utf-8 -f console256 -g'
alias df='df -H'
alias g='gcd'
alias h=history
alias j='jobs -l'
alias l=less
alias lg=lazygit
#alias s=screen
alias tig='tig --all'
alias xd='LC_ALL=C hexdump -C'
alias -g F='| fzf-tmux'
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g LE='2>&1 | less'
alias -g T='| tail'
alias -g V='| view -'
alias -g W='| wc -l'
case `uname` in
    Darwin)
	eval $(gdircolors ~/.ghq/github.com/arcticicestudio/nord-dircolors/src/dir_colors)
	alias nvr='"$HOME"/.pyenv/versions/`pyenv global`/bin/nvr --remote-silent'
	alias ll='gls -lF --color=auto'
	alias lll='gls -lFL --color=auto'
	alias ls='gls -F --color=auto'
	alias o='open'
	alias sl='gls -F --color=auto'
	alias top='top -o cpu'
	alias zzz='osascript -e "tell application \"System Events\" to sleep"'
	;;
    Linux|NetBSD)
	eval $(gdircolors ~/.ghq/github.com/arcticicestudio/nord-dircolors/src/dir_colors)
	alias ll='ls -lF --color=auto'
	alias lll='ls -lFL --color=auto'
	alias ls='ls -F --color=auto'
	alias sl='ls -F --color=auto'
	;;
esac

autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*:*:cdr:*:*' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

compdef platex=latex

bindkey -v
bindkey -M viins '^G' vi-cmd-mode
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^D' delete-char-or-list
bindkey -M viins '^E' end-of-line
bindkey -M viins '^F' forward-char
bindkey -M viins '^K' kill-line
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^Y' yank
bindkey -M viins '^_' copy-prev-word

zstyle ':filter-select:highlight' selected bg=white
zstyle ':filter-select:highlight' matched fg=yellow,standout
zstyle ':filter-select' case-insensitive yes

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -Uz anyframe-init
anyframe-init
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-cdr
bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

function _my_clear_screen() {
	echo -n "\033[999;1H\033[2J"
	zle reset-prompt
}
zle -N my_clear_screen _my_clear_screen
bindkey "^L" my_clear_screen

function gcd() {
	local dir=`ghq list | fzf`
	if [ ! -z $dir ]; then
		cd `ghq root`/$dir
	fi
}

function my-quick-fg () {
	if [ $(jobs -s | wc -l) -gt 0 ]; then
		BUFFER="fg"
		zle accept-line
	fi
}
zle -N my-quick-fg
bindkey '^Z' my-quick-fg

eval "$(starship init zsh)"
