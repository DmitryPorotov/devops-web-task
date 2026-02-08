#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: create and deploy self signed certificate
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit
set -o pipefail
set -o nounset

LOG_FILE_PATH="../logs/selfsigned-cert.log"

. ./lib.sh

function main() {
    check_for_root
    generate_cert
}

function generate_cert() {
    openssl req -x509 -nodes -newkey rsa:4096 \
-keyout /etc/nginx/ssl/certs/devops-web.key \
-out /etc/nginx/ssl/certs/devops-web.crt \
-days 365 -subj "/CN=dev-ops-site" && output_and_log 1 "Created and deployed certificate"
}

main

