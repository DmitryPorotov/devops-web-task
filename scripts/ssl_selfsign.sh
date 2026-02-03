#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: create and deploy self signed certifecate
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit

if [[ $EUID != 0 ]]; then
    echo >&2 "This script needs root privelegies to run"
    exit 1
fi

openssl req -x509 -nodes -newkey rsa:4096 \
-keyout /etc/nginx/ssl/certs/devops-web.key \
-out /etc/nginx/ssl/certs/devops-web.crt \
-days 365 -subj "/CN=dev-ops-site"