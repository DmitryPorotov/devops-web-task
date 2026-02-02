#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: 
# version: 0.0.1
# date: 2026-02-02
###################################### 

echo "Creating webdeploy user and making a dir"

useradd webdeploy &&\
    mkdir -p /var/www/devops-site &&\
    chown webdeploy:webdeploy /var/www/devops-site 

echo "Installing nginx"

which nginx || apt install nginx