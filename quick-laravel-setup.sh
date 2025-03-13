#!/bin/bash

APP_NAME="$1"
APP_DOMAIN=$APP_NAME".test"
APP_PATH="/var/www/$APP_NAME/public"

# Check for required arguments
if [ -z "$APP_NAME" ]; then
    echo "Usage: $0 <app_name>"
    exit 1
fi

echo "127.0.0.1 $APP_DOMAIN" | sudo tee -a /etc/hosts >/dev/null

sudo tee /etc/apache2/sites-available/$APP_DOMAIN.conf >/dev/null <<EOF
<VirtualHost *:80>
    ServerName $APP_DOMAIN
    DocumentRoot $APP_PATH

    <Directory $APP_PATH>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Enable site and disable default site
sudo a2ensite $APP_DOMAIN.conf
# sudo a2dissite 000-default.conf

# Restart Apache
sudo systemctl restart apache2

echo "Laravel application setup complete!"
echo "You can access your application at http://$APP_DOMAIN"
