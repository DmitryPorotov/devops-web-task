#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: one time first setup on a server
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit
set -o pipefail
set -o nounset

. ./lib.sh

check_for_root

echo "Creating webdeploy user and making dirs"

useradd webdeploy &&\
    usermod -aG www-data webdeploy &&\
    mkdir -p /var/www/devops-site &&\
    chown webdeploy:www-data /var/www/devops-site
    
echo "Installing nginx"

which nginx || apt install -y nginx && rm /etc/nginx/sites-enabled/default