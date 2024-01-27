#!/usr/bin/env bash

# Not authorized for use outside the EPAM challage.
#
# Copyright Mario Yepes <marioy47@gmail.com> 2024

set -Eeuo pipefail

echo "Checking if a SugarCRM installation is required"

if [ -f /var/www/html/sugarcrm/index.php ]; then
  echo "Looks like SugarCRM is already installed."
  echo "If you want to re-install sugar execute 'docker-compose exec web rm -rf /var/www/html/sugarcrm'"
  echo "And then restart the container"
else
  if [ ! -f /tmp/sugarinstaller/*.zip ]; then
    echo "SugarCRM is not installed and there is no installer!!!!!!!!"
    echo "Place the .zip installer file in sugarinstaller/ and restart the container"
  else
    echo "Installing sugar in /var/www/html/sugarcrm/"
    rm -rf /tmp/sugartemp/
    mkdir -p /tmp/sugartemp
    chmod 777 /tmp/sugartemp
    cd /tmp/sugartemp/
    sudo -H -u www-data bash -c "unzip -q /tmp/sugarinstaller/*.zip"
    cd Sugar*
    sudo -H -u www-data bash -c "rsync -a ./ /var/www/html/sugarcrm/"
    sudo -H -u www-data bash -c 'cp /tmp/sugarinstaller/*.php /var/www/html/sugarcrm/'
    echo "Sugar CRM installed, Go to http://sugar.lndo.site:8080/sugarcrm to access the site"
  fi
fi

exec "$@"
