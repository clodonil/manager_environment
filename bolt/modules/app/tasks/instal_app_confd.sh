#!/bin/bash


mkdir /opt/app
cd /opt/app
unzip /opt/app.zip 

cp /opt/app/confd-templates/app.toml /etc/conf.d/
cp /opt/app/confd-templates/config.tmpl /etc/conf.d/templates


