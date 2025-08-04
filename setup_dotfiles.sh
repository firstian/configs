#! /usr/bin/env bash

stow --dotfile git

if [[ -f ~/.zprofile ]]; then
  mv ~/.zprofile ~/.zprofile.bak
fi

if [[ -f ~/.zshrc ]]; then
  mv ~/.zshrc ~/.zshrc.bak
fi

stow --dotfile zsh

# Make sure .config dir exists, or stow will fail.
mkdir -p ~/.config
stow dot-config -t ~/.config

# These need to be customize anyway.
# stow ssh -t ~/.ssh
# stow aws -t ~/.aws
