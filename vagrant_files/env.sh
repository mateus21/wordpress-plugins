ADDITIONAL_SOFTWARES="vim htop"

PHP_VERSION="7.0"

# Vagrant constants
MACHINE_NAME="wp-plugin"
PRIVATE_IP="10.10.10.90"
VAGRANT_TARGET="/var/www/b2w"
LOCAL_PATH="/home/mateus/projetos/wordpress-plugins"

SERVER_NAME="dev.wp-plugin.com.br"

SYNCFOLDER_PATH="/home/mateus/projetos/wordpress-plugins/vagrant_files/sync"
SYNCFOLDER_TARGET="/tmp/sync"

MYSQL_USER_NAME="root"
MYSQL_DUMP_NAME="b2w.sql"
MYSQL_PASSWORD="password"
MYSQL_HOST="localhost"
MYSQL_DATABASE_NAME="b2w"

WORDPRESS_SALT_URL="https://api.wordpress.org/secret-key/1.1/salt/"

VIRTUAL_HOST="<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port t$
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        ServerName $SERVER_NAME
        DocumentRoot $VAGRANT_TARGET
        <Directory $VAGRANT_TARGET>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Require all granted
        </Directory>

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with \"a2disconf\".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>"

