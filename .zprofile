PATH=$HOME/.bin:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/Volumes/crosstoolsng/x-tools/arm-cortexa9_neon-linux-gnueabihf/bin:$PATH
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
	export PATH=${PYENV_ROOT}/bin:$PATH
	eval "$(pyenv init -)"
fi

export PATH="$HOME/.nodebrew/current/bin:$PATH"
