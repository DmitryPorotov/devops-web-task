#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: common functions
# version: 0.0.1
# date: 2026-02-03
###################################### 


function output_and_log() {
    if [[ ! -d ../logs ]] ;then 
        mkdir ../logs
    fi

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $2" | tee -a $LOG_FILE_PATH >&$1
}

function check_for_root() {
    if [[ $EUID != 0 ]]; then
        echo >&2 "This script needs root privelegies to run"
        exit 1
    fi
}