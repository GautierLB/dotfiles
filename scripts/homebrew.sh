#!/usr/bin/env bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle -v --file=resources/Brewfile

# unlink homebrew's default php version to clean the env, then link our default version
brew unlink php
brew link php@7.4 --force
