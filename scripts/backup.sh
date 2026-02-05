#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: Backing up and zipping the web site
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit
set -o pipefail
set -o nounset

LOG_FILE_PATH="../logs/backup.log"

. ./lib.sh

function main() {
    copy_files
    zip_backups
}

function copy_files() {
    nowdate=$(date +"%Y-%m-%d-%H-%M-%S")

    output_and_log 1 "Creating backup $nowdate"

    mkdir -p "../backup/$nowdate" &&\
    cp /var/www/devops-site/* "../backup/$nowdate"
}

function zip_backups() {
    numdirs=$(ls -ld ../backup/* | wc -l)

    if [[ $numdirs -ge 5 ]]; then 
        cd ../backup
        dirs=$(ls -ldt */ | awk '{ print $9 }')
        mapfile -t array <<< "$dirs"
        i=0
        for b in "${array[@]}"; do
            if [[ $i -ge 5 ]]; then
                echo "$b"
                zip -r "${b%?}.zip" "$b" && rm -rf "$b"
            fi
            i=$(( $i + 1 ))
        done  
    fi
}

main