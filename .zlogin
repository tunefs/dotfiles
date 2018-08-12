case $TERM in
xterm*|kterm*)
        stty erase ^H kill ^U
        ;;
esac
stty -ixon
