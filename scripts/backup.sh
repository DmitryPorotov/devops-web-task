#!/usr/bin/env bash
######################################
# created by: Dmitry Porotov
# purpose: 
# version: 0.0.1
# date: 2026-02-02
###################################### 
set -o errexit

nowdate=$(date +"%Y-%m-%d-%H-%M-%S")

mkdir "/var/www/backup/$nowdate" &&\
cp /var/www/devops-site/* "/var/www/backup/$nowdate"

numdirs=$(ls -ld */ | wc -l)

if [[ $numdirs -ge 5 ]]
then ll
fi