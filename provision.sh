#!/bin/bash
# Script to set up a Django project on Vagrant.
# Installation settings

PROJECT_NAME=$1

DB_NAME=$PROJECT_NAME
VIRTUALENV_NAME=$PROJECT_NAME

PROJECT_DIR=/vagrant
DJANGO_DIR=$PROJECT_DIR/$PROJECT_NAME
VIRTUALENV_DIR=/home/vagrant/.virtualenvs/$PROJECT_NAME

PGSQL_VERSION=9.4
ELASTICSEARCH_VERSION=1.6.0

# Need to fix locale so that Postgres creates databases in UTF-8
cp -p $PROJECT_DIR/configs/vagrant/etc-bash.bashrc /etc/bash.bashrc
locale-gen en_ZA.UTF-8
dpkg-reconfigure locales

export LANGUAGE=en_ZA.UTF-8
export LANG=en_ZA.UTF-8
export LC_ALL=en_ZA.UTF-8

# Install essential packages from Apt
apt-get update -y > /dev/null 2>&1
# Python dev packages
apt-get install -y build-essential python3 python3-dev python3-pip

# Dependencies for image processing with Pillow (drop-in replacement for PIL)
# supporting: jpeg, tiff, png, freetype, littlecms
# (pip install pillow to get pillow itself, it is not in requirements.txt)
apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev

apt-get install -y git

# Java
add-apt-repository ppa:webupd8team/java
apt-get update
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get install oracle-java7-installer -y

update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-7-oracle/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-7-oracle/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/java-7-oracle/bin/javaws" 1
update-alternatives --set java /usr/lib/jvm/java-7-oracle/bin/java
update-alternatives --set javac /usr/lib/jvm/java-7-oracle/bin/javac
update-alternatives --set javaws /usr/lib/jvm/java-7-oracle/bin/javaws

# Rabbitmq
if [[ ! -f /usr/sbin/rabbitmq-server ]]; then
    apt-get install -y rabbitmq-server
    rabbitmq-plugins enable rabbitmq_management
    /etc/init.d/rabbitmq-server restart
    rabbitmqctl add_user $PROJECT_NAME $PROJECT_NAME
    rabbitmqctl add_vhost $PROJECT_NAME
    rabbitmqctl set_permissions -p $PROJECT_NAME $PROJECT_NAME ".*" ".*" ".*"
    rabbitmqctl set_user_tags $PROJECT_NAME administrator
fi

# Postgresql
if ! command -v psql; then
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    apt-get update > /dev/null 2>&1
    apt-get install -y postgresql-$PGSQL_VERSION libpq-dev
    cp $PROJECT_DIR/configs/vagrant/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
    /etc/init.d/postgresql reload
fi

# Elasticsearch
if [[ ! -f /usr/share/elasticsearch/bin/elasticsearch ]]; then
    wget -q https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ELASTICSEARCH_VERSION.deb
    dpkg -i elasticsearch-$ELASTICSEARCH_VERSION.deb
    rm elasticsearch-$ELASTICSEARCH_VERSION.deb
    echo "PID_DIR=/var/run" >> /etc/default/elasticsearch
    update-rc.d elasticsearch defaults 95 10
    /etc/init.d/elasticsearch start
fi

# Redis
apt-get install -y redis-server

# Mongo
apt-get install -y mongodb mongodb-server

# virtualenv global setup
if [[ ! -f /usr/local/bin/virtualenv ]]; then
    pip3 install virtualenv virtualenvwrapper stevedore virtualenv-clone
fi

# bash environment global setup
cp -p $PROJECT_DIR/configs/vagrant/bashrc /home/vagrant/.bashrc
su - vagrant -c "mkdir -p /home/vagrant/.pip_download_cache"

# postgresql setup for project
createdb -U postgres $DB_NAME

echo "workon $VIRTUALENV_NAME" >> /home/vagrant/.bashrc

# Set execute permissions on manage.py, as they get lost if we build from a zip file
chmod a+x $DJANGO_DIR/manage.py

# Django project setup
su - vagrant -c "source $VIRTUALENV_DIR/bin/activate && cd $DJANGO_DIR && python manage.py migrate"

# virtualenv setup for project
su - vagrant -c "/usr/local/bin/virtualenv $VIRTUALENV_DIR && \
    echo $PROJECT_DIR > $VIRTUALENV_DIR/.project && \
    PIP_DOWNLOAD_CACHE=/home/vagrant/.pip_download_cache $VIRTUALENV_DIR/bin/pip install -r $PROJECT_DIR/requirements/local.txt"
