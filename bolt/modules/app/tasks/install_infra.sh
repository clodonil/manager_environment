#!/bin/bash

sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip
sudo pip3.6 install flask 

echo "pacotes instalados"