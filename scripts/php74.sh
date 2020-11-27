#!/usr/bin/env bash

set -euo pipefail

export PATH="$(brew --prefix php@7.4)/bin:$PATH"

# xdebug
cat << EOF > /usr/local/etc/php/7.4/conf.d/ext-xdebug.ini
[xdebug]
# zend_extension="xdebug.so" # already registered by pecl
xdebug.profiler_enable=Off
xdebug.profiler_enable_trigger=1
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_port=9000
xdebug.remote_connect_back=1
xdebug.idekey=PHPSTORM
#xdebug.remote_log = /tmp/xdebug.log
EOF

# setup fpm listening port
sed -i '' -e 's/listen = 127\.0\.0\.1:9000/listen = 127.0.0.1:9004/' /usr/local/etc/php/7.4/php-fpm.d/www.conf

# unlimited memory_limit
sed -Ei '' 's/(memory_limit = )[0-9]+M/\1-1/g' /usr/local/etc/php/7.4/php.ini

# pecl extensions
pecl update-channels
pecl install apcu <<<''
pecl install xdebug <<<''
