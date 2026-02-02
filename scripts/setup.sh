#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: one time first setup on a server
# version: 0.0.1
# date: 2026-02-02
###################################### 

echo "Creating webdeploy user and making a dir"

useradd webdeploy &&\
    usermod -aG www-data webdeploy &&\
    mkdir -p /var/www/devops-site &&\
    mkdir -p /var/www/backup &&\
    chown webdeploy:www-data /var/www/devops-site &&\
    chown webdeploy:www-data /var/www/backup

echo "Installing nginx"

which nginx || apt install -y nginx