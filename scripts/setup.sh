#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: one time first setup on a server
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit

if [[ $EUID != 0 ]]; then
    echo >&2 "This script needs root privelegies to run"
    exit 1
fi

echo "Creating webdeploy user and making dirs"

useradd webdeploy &&\
    usermod -aG www-data webdeploy &&\
    mkdir -p /var/www/devops-site &&\
    mkdir -p /var/www/backup &&\
    chown webdeploy:www-data /var/www/devops-site &&\
    chown webdeploy:www-data /var/www/backup

echo "Installing nginx"

which nginx || apt install -y nginx && rm /etc/nginx/sites-enabled/default