# Configure terminal locale
export LANG=en_US.UTF-8

# Set gpg-agent environment
export GPG_TTY=$(tty)

# Open VS Code in terminal (code)
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

# Output highlighting
export CLICOLOR=1

# Set network environment
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

# Set custom R library to avoid missing libPath after `brew update`
if [ -n $R_LIBS ]; then
   export R_LIBS=/usr/local/share/rlibs:$R_LIBS
else
   export R_LIBS=/usr/local/share/rlibs
fi

# Auto suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
