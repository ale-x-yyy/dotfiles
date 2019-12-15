system=$(uname)
system_prefix="/usr/local"
ls_color_arg=""

if [ "${system}" = "Darwin" ]; then
	system_prefix=$(brew --prefix)
    ls_color_arg="-G"
elif [ "${system}" = "Linux" ]; then
    system_prefix="/usr"
    ls_color_arg="--color=auto"
else
	echo -e "Zsh: Unknown system ~ ${system}\n" >&2
fi

# Initialize fpath
fpath=(${system_prefix}/share/zsh-completions $fpath)
fpath=($HOME/.zsh/pure $fpath)

# Load plugins
autoload -U compinit; compinit
autoload -U promptinit; promptinit

# Initializw prompt
prompt pure

# Enable case-insensitive matching only if there are no case-sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Enable syntax highlighting
source ${system_prefix}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ls='ls ${ls_color_arg}'
alias la='ls -la'
alias grep='grep --color=auto'

alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
alias dfs='dotfiles status'
alias dfa='dotfiles add'
alias dfc='dotfiles commit -m'
alias dfp='dotfiles push'
alias dfr='dotfiles rebase'

# Fix python links
# brew info python -> symlinks
export PYTHON_BREW_PATH=/usr/local/opt/python/libexec/bin
export GOPATH=$HOME/Code/Go
export PATH=$PYTHON_BREW_PATH:$PATH:$GOPATH

# Source non-versioned zshrc
if [[ -f "$HOME/.zshrcnv" ]]; then
    . "$HOME/.zshrcnv"
fi
