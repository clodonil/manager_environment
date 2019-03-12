#!/bin/bash


mkdir /opt/app
cd /opt/app
unzip /opt/app.zip 

cp /opt/app/confd-templates/app.toml /etc/confd/conf.d/
cp /opt/app/confd-templates/config.tmpl /etc/confd/templates/

echo "App instalado"



