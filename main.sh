#!/usr/bin/env bash

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
