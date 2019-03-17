#!/bin/bash

#Pre-requisitos
sudo yum install -y wget

#Download
wget https://releases.hashicorp.com/consul-template/0.20.0/consul-template_0.20.0_linux_386.tgz

#install
tar -xzvf consul-template*
mv consul-template /usr/bin
