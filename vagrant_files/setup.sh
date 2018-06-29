#!/bin/bash

source /tmp/env.sh

echo "---- Iniciando instalação ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando pacotes basicos ---"
sudo apt-get install $ADDITIONAL_SOFTWARES -y

echo "--- Instalando MySQL ---"
debconf-set-selections <<< 'mysql-server-<version> mysql-server/root_password password password'
debconf-set-selections <<< 'mysql-server-<version> mysql-server/root_password_again password password'
sudo apt-get install mysql-server -y
sudo apt-get install mysql-client -y

echo "--- Instalando PHP, Apache e alguns modulos ---"
sudo apt-get install php$PHP_VERSION php$PHP_VERSION-common -y
sudo apt-get install php$PHP_VERSION-cli php$PHP_VERSION-xmlrpc php$PHP_VERSION-soap libapache2-mod-php$PHP_VERSION php$PHP_VERSION-mysql php$PHP_VERSION-curl php$PHP_VERSION-xml php$PHP_VERSION-mcrypt php$PHP_VERSION-mbstring php$PHP_VERSION-gd php$PHP_VERSION-intl php$PHP_VERSION-zip zip unzip -y

echo "--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "$VIRTUAL_HOST" > /etc/apache2/sites-available/000-default.conf;

echo "--- Criando e importando o Banco de Dados ---"
mysql -u $MYSQL_USER_NAME -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "create database $MYSQL_DATABASE_NAME;"
mysql -u $MYSQL_USER_NAME -p$MYSQL_PASSWORD -h $MYSQL_HOST $MYSQL_DATABASE_NAME < $VAGRANT_TARGET/vagrant_files/database/$MYSQL_DUMP_NAME

#echo "--- Substituindo o wp-config.php ---"
#WP_CONFIG_FILE="$(cat $VAGRANT_TARGET/wp-config-sample.php)"
#eval "echo \"$WP_CONFIG_FILE\" > $VAGRANT_TARGET/wp-config.php"

echo "--- Reiniciando Apache ---"
sudo service apache2 restart

echo "[OK] --- Instalação do ambiente de desenvolvimento concluído ---"
