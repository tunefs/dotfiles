export CLICOLOR=1
export EDITOR=vi
#export FZF_CTRL_R_OPTS='--sort'
export FZF_DEFAULT_OPTS="--cycle --no-mouse --inline-info --color=dark"
# export FZF_DEFAULT_OPTS="--cycle --no-mouse \
#  --color fg:242,hl:65,fg+:15,hl+:108 \
#  --color info:108,prompt:109,spinner:108,pointer:168,marker:168"
export FZF_TMUX=1
# export FZF_TMUX_HEIGHT="50%"
#unset LANG
#export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8
#export LC_MESSAGES=C
#export LC_MONETARY=C
#export LC_NUMERIC=C
#export LC_TIME=C
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
export LESS=FiMQRsX
export LESSCHARSET=utf-8
#export LESSOPEN="|pygmentize -O encoding=utf-8 -f console256 -g %s"
# export LESSOPEN='| ${HOME}/bin/src-hilite-lesspipe.sh %s'
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export PAGER=less
if [ x"$EMACS" != x ]; then
    export TERM=Eterm-color
fi
case `uname` in
    Darwin)
	export BLOCKSIZE=1024
	export DISPLAY=unix:0.0
	export SHELL=/bin/zsh
#	PATH=$PATH:/Applications/UpTeX.app/teTeX/bin:$HOME/local/android-sdk-macosx/tools:$HOME/local/android-sdk-macosx/platform-tools
	;;
esac
export PATH=$HOME/bin:/usr/local/bin:$PATH:/Volumes/crosstoolsng/x-tools/arm-cortexa9_neon-linux-gnueabihf/bin
