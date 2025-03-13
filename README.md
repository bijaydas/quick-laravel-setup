# Quick Laravel Local Setup Script

Automate your process of setting up a local Laravel development environment on Ubuntu using Apache2.

## Prerequisites

* **Ubuntu:** This script is designed for Ubuntu-based systems.
* **Apache2:** Apache web server must be installed.
* **`sudo` Access:** You'll need `sudo` privileges to run this script.

## How to Use

1. Clone the repository and get into it:

    ```bash
    git clone git@github.com:bijaydas/quick-laravel-setup.git qls
    cd qls
    ```

2. Make it Executable:

      ```bash
      chmod +x setup-laravel.sh
      ```

3. Run the Script:

      ```bash
      ./setup-laravel.sh <app_name>
      ```

4. Once the script finishes, you can access your Laravel application in your browser by going to `http://your_app.test`

## What the Script Does

* **Adds to `/etc/hosts`:**
  * Adds an entry to your `/etc/hosts` file, mapping your local domain to `127.0.0.1` (your local machine).
* **Creates Apache Virtual Host:**
  * Creates a new Apache configuration file in `/etc/apache2/sites-available/` for your application.
  * Configures the `ServerName`, `DocumentRoot`, and directory permissions.
* **Enables the Site:**
  * Enables the new Apache site using `a2ensite`.
* **Enables `mod_rewrite`:**
  * Enables the `mod_rewrite` Apache module, which is essential for Laravel routing.
* **Restarts Apache:**
  * Restarts the Apache2 service to apply the changes.
* **Provides Feedback:**
  * Displays messages during the script's execution to inform you of its progress.

## Important Notes

* **Application Path:** The script assumes your Laravel application is located in `/var/www/your-app/public`. If your application is in a different location, you'll need to modify the `APP_PATH` variable in the script.
* **Domain Name:** Choose a local domain name that you'll use for development (e.g., `your-app.local`, `your-app.test`).
* **Error Handling:** The script includes basic error checking. If you encounter any issues, check the terminal output for error messages.
* **Security:** This script is designed for local development. Avoid running it on production servers.
* **Manual Steps:** If this script does not work, you can always manually perform the steps that it automates.
