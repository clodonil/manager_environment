#!/bin/bash

yum install -y unzip 
curl -O https://releases.hashicorp.com/vault/1.0.3/vault_1.0.3_linux_amd64.zip
unzip vault_*
cp vault /usr/bin/
cp /vagrant/vault/vault.cnf /etc/default/
cp /vagrant/vault/vault.service /etc/systemd/system/vault.service

systemctl daemon-reload
systemctl enable vault.service
systemctl restart vault.service

export VAULT_ADDR='http://192.168.77.100:8200'

