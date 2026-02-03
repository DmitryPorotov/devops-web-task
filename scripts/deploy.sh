#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: 
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit
set -o pipefail

LOG_FILE_PATH="../logs/deploy.log"

. ./lib.sh

function main() {
    check_for_root
    output_and_log 1 "Deploying new version."
    cp -u ../site/* /var/www/devops-site/
    chown -R webdeploy:www-data /var/www/devops-site/
}

main
