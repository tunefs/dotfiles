PATH=$HOME/bin:$PATH:$HOME/Library/Android/sdk/platform-tools
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
	export PATH=${PYENV_ROOT}/bin:$PATH
	eval "$(pyenv init -)"
fi

export PATH="$HOME/.cargo/bin:$PATH"
