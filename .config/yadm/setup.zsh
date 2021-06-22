#!/bin/zsh
cd $HOME
system_type=$(uname -s)
grey=$(tput setaf 8)
red=$(tput setaf 9)
green=$(tput setaf 10)
yellow=$(tput setaf 11)
reset=$(tput sgr0)

function log_info() {
  echo "${grey}[$(date '+%Y-%m-%d %H:%M:%S')]${reset} ${green}INFO${reset} $1"
}
function log_warn() {
  echo "${grey}[$(date '+%Y-%m-%d %H:%M:%S')]${reset} ${yellow}WARN${reset} $1"
}
function log_error() {
  echo "${grey}[$(date '+%Y-%m-%d %H:%M:%S')]${reset} ${red}ERROR${reset} $1"
}

function passport() {
  if [ "$system_type" != "Darwin" ]; then
    log_error "Wrong device. Aborting..."
    exit 1
  else
    log_info "Prepared to restore environment..."
  fi
}

function pour_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    log_info "Installing homebrew.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  else
    log_warn "Homebrew exists. No alcohol abuse."
  fi
}

function set_yadm() {
  if brew ls --versions yadm > /dev/null; then
    log_warn "Yadm appears to be installed. Checking if recent update exists..."
    brew upgrade yadm --quiet
  else
    log_info "Yadm is not installed. Installing"
    brew install yadm --quiet
  fi
}

function clone_dotfiles() {
  if [ -f "$HOME/.Brewfile" ]; then
    log_error "Dotfiles already exists. Aborting to avoid duplication."
    exit 1
  else
    log_info "Cloning the dotfiles repo and setting up..."
    yadm clone https://github.com/derbalkon/dotfiles.git --bootstrap
  fi
}

passport
pour_homebrew
set_yadm
clone_dotfiles
