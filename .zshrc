umask 022

function zle-line-init zle-keymap-select {
	VIM_NORMAL="%F{4}[%30<...<%~%<<]%f"
	VIM_INSERT="%F{2}[%30<...<%~%<<]%f"
	PROMPT="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}%B%#%b "
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

CDPATH=.:$HOME
HISTFILE=$HOME/.zshhist
HISTSIZE=1000000
MAILPATH=/var/mail/$USER
READNULLCMD=less
SAVEHIST=1000000
WORDCHARS=${WORDCHARS//[\-\/.]}

fpath=($HOME/projects/private/anyframe(N-/) $fpath)

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
#alias c='echo -n "\033[999;1H\033[2J"'
alias c='pygmentize -O encoding=utf-8 -f console256 -g'
alias df='df -H'
alias dirs='dirs -v'
alias e4='expand -t 4'
alias gst='vi `git rev-parse --show-toplevel`/.git/index'
alias gg='say finished'
alias h=history
alias hgst='hg st `hg root`'
alias j='jobs -l'
alias l=less
alias rgrep='grep -r --exclude="*.svn*"'
#alias s=screen
alias today='date +"%Y-%m-%d"'
alias xd='LC_ALL=C hexdump -C'
alias -g E4='| expand -t 4'
alias -g F='| fzf-tmux'
alias -g FE='2>&1 | fzf-tmux'
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g LE='2>&1 | less'
alias -g LV='| lv'
alias -g T='| tail'
alias -g V='| view -'
alias -g W='| wc -l'
case `uname` in
    Darwin)
	eval $(gdircolors ~/projects/private/dircolors-solarized/dircolors.ansi-universal)
	alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
	alias ee='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw'
	alias em='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
	alias ll='gls -lF --color=auto'
	alias lll='gls -lFL --color=auto'
	alias ls='gls -F --color=auto'
	alias o='open'
	alias oa='open -a'
	alias sl='gls -F --color=auto'
	alias top='top -o cpu'
	alias zzz='osascript -e "tell application \"System Events\" to sleep"'
	;;
    Linux|NetBSD)
	alias e='emacsclient -n'
	alias ee='emacsclient -nw'
	alias ll='ls -lF'
	alias lll='ls -lFL'
	alias ls='ls -F'
	alias sl='ls -F'
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
#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
#bindkey "^[P" history-beginning-search-backward-end
#bindkey "^[p" history-beginning-search-backward-end
#bindkey "^[N" history-beginning-search-forward-end
#bindkey "^[n" history-beginning-search-forward-end

#zmodload zsh/deltochar
#bindkey "^[z" delete-to-char

#source ~/.zsh/zaw/zaw.zsh
#bindkey "^x^b" zaw
#bindkey "^xb" zaw-cdr
#bindkey "^x^r" zaw-history
zstyle ':filter-select:highlight' selected bg=white
zstyle ':filter-select:highlight' matched fg=yellow,standout
zstyle ':filter-select' case-insensitive yes

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source ~/projects/private/enhancd/init.sh
# source ~/projects/private/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
autoload -Uz anyframe-init
anyframe-init
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-cdr
bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

mcd() {
	mkdir $1 && chdir $1
}

ftpane() {
	local panes current_window current_pane target target_window target_pane
	panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
	current_pane=$(tmux display-message -p '#I:#P')
	current_window=$(tmux display-message -p '#I')
	target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return
	target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
	target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)
	if [[ $current_window -eq $target_window ]]; then
		tmux select-pane -t ${target_window}.${target_pane}
	else
		tmux select-pane -t ${target_window}.${target_pane} &&
			tmux select-window -t $target_window
	fi
}

function _my_clear_screen() {
	echo -n "\033[999;1H\033[2J"
	zle reset-prompt
}
zle -N my_clear_screen _my_clear_screen
bindkey "^L" my_clear_screen

app() {
	apppath=`find /Applications -maxdepth 3 -type d | grep '\.app$' | sed 's/\/Applications\///' | sed 's/\.app$//' | fzf --prompt="App> " --exit-0`
	if [ -n "$apppath" ]; then
		open -a "/Applications/$apppath.app"
	fi
}
