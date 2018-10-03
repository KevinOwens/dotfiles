#!/usr/bin/env bash
# 
# Bootstrap script for setting up a new OSX machine
# 
# Originally Forked from: codeinthehole/osx_bootstrap.sh

# This should be idempotent so it can be run multiple times.
#
# Notes:
#
# - If installing full Xcode, it's better to install that first from the app
#   store before running the bootstrap script. Otherwise, Homebrew can't access
#   the Xcode libraries as the agreement hasn't been accepted yet.
#
# Reading:
#
# - https://gist.github.com/MatthewMueller/e22d9840f9ea2fee4716

echo "Starting bootstrap"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    ack
    git
    go
    leiningen
    libyaml
    libffi
    memcached
    mongodb
    npm
    openssl
    the_silver_searcher
    tmux
    vim
    wget
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Configuring OSX..."

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES

#install go-powerline
go get -u github.com/justjanne/powerline-go

#install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.1

asdf plugin-add ruby
asdf plugin-add nodejs
asdf plugin-add python

echo "Bootstrapping complete"

