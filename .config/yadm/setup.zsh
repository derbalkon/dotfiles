#!/bin/zsh
set -e
system_type=$(uname -s)
cd $HOME

echo ">>> Preparing to restore environment..."

# abort if it is not macOS
if [ "$system_type" != "Darwin" ]; then
  echo "Not supported: non-Apple OS."
  exit 1
fi

# install homebrew if it's missing
if ! command -v brew >/dev/null 2>&1; then
  echo ">>> Installing homebrew.."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# set up once dotfiles repo has been cloned
echo ">>> Cloning the dotfiles repo and setting up..."
brew install yadm
yadm clone https://github.com/derbalkon/dotfiles.git --bootstrap