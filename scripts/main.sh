#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

cp .* ~/

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "${DIR}/../"

# Install homebrew & dependencies
./scripts/homebrew.sh

# Computer configuration
./scripts/computer.sh

# Configure php
./scripts/php74.sh

echo "Restarting services, your password may be required"
sudo brew services restart nginx
sudo brew services restart php@7.2
sudo brew services restart php@7.4
