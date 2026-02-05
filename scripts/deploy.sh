#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: 
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit
set -o pipefail
set -o nounset

LOG_FILE_PATH="../logs/deploy.log"

. ./lib.sh

function main() {
    check_for_root
    output_and_log 1 "Deploying new site version."
    copy_site_files
    copy_nginx_config_and_reload
}

function copy_site_files() {
    cp -u ../site/* /var/www/devops-site/
    chown -R webdeploy:www-data /var/www/devops-site/
}

function copy_nginx_config_and_reload() {
    ln -s ../nginx/site.conf /etc/nginx/sites-enabled
    if ! nginx -t; then
        output_and_log 2 "Nginx config is broken!"
        exit 1
    fi
    systemctl reload nginx.service
}

main
