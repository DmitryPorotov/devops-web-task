#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: roll back the web site from last backup
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit
set -o pipefail
set -o nounset

LOG_FILE_PATH="../logs/rollback.log"

. ./lib.sh

function main() {
    check_for_root
    last_backup=$(get_last_backup_name)
    output_and_log 1 "Rolling back from $last_backup"
    copy_from_backup "$last_backup"
}

function get_last_backup_name() {
    cd ../backup
    dirname=$(ls -ldt */ | head -1 |  awk '{ print $9 }')
    echo "${dirname%?}"
}

function copy_from_backup() {
    if [[ ! -d "../backup/$1" ]]; then
        output_and_log 2 "Backup does not exist"
    fi

    cp -u "../backup/$1/"* /var/www/devops-site/
    chown -R webdeploy:www-data /var/www/devops-site/
}

main