#! /usr/bin/env bash

stow --dotfile git
stow --dotfile zsh
stow vim -t ~/.config

# These need to be customize anyway.
# stow ssh -t ~/.ssh
# stow aws -t ~/.aws
