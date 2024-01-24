#!/usr/bin/env bash
#
set -Eeuo pipefail

cd /var/www/html
sudo -H -u www-data bash -c 'unzip /tmp/sugarinstaller/*.zip'
mv Sugar* sugarcrm
exec "$@"
