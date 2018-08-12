export CLICOLOR=1
export EDITOR=vi
#export ENHANCD_FILTER="fzf-tmux -d 50%"
export ENHANCD_USE_FUZZY_MATCH=0
#export FZF_CTRL_R_OPTS='--sort'
#export FZF_DEFAULT_OPTS="--cycle --no-mouse --color=dark --inline-info"
#export FZF_DEFAULT_OPTS="--cycle --no-mouse --inline-info \
#--color fg:-1,bg:-1,hl:33,fg+:-1,bg+:7,hl+:33 \
#--color info:136,prompt:136,pointer:166,marker:166,spinner:136"
export FZF_DEFAULT_OPTS="--cycle --no-mouse --inline-info \
--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 \
--color info:254,prompt:37,spinner:108,pointer:235,marker:235"
export FZF_TMUX=1
# export FZF_TMUX_HEIGHT="50%"
#unset LANG
#export LC_COLLATE=C
#export LC_CTYPE=ja_JP.UTF-8
#export LC_MESSAGES=C
#export LC_MONETARY=C
#export LC_NUMERIC=C
#export LC_TIME=C
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export LESS=iMQRs
export LESSCHARSET=utf-8
#export LESSOPEN="|pygmentize -O encoding=utf-8 -f console256 -g %s"
#export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export PAGER=less
if [ x"$EMACS" != x ]; then
    export TERM=Eterm-color
fi
#MANPATH=/usr/local/share/man:/usr/share/man:/usr/X11R6/man
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin
case `uname` in
    Darwin)
	export BLOCKSIZE=1024
	export DISPLAY=unix:0.0
	export SHELL=/bin/zsh
#	MANPATH=/opt/local/share/man:$MANPATH
#	PATH=$PATH:/Applications/UpTeX.app/teTeX/bin:$HOME/local/android-sdk-macosx/tools:$HOME/local/android-sdk-macosx/platform-tools
	;;
esac
#export PATH=$HOME/bin:$PATH
#export MANPATH
