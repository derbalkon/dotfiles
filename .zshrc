# Configure terminal locale
export LANG=en_US.UTF-8

# Set gpg-agent environment
export GPG_TTY=$(tty)

# Open VS Code in terminal (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Syntax highlighting
source ${ZDOTDIR:-$HOME}/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
