#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: 
# version: 0.0.1
# date: 2026-02-02
###################################### 

ls /var/www/devops-site/backup || mkdir -p /var/www/devops-site/backup

nowdate=$(date +"%Y-%m-%d-%H-%M-%S")

mkdir "/var/www/devops-site/backup/$nowdate"

numdirs=$(ls -ld */ | wc -l)

if [[ 5 == numdirs ]]
then 