#!/bin/bash

sudo rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-6.noarch.rpm
sudo yum install -y puppet-bolt	

sudo /usr/local/bin/bolt command run 'uptime'  --node localhost

sudo cp /vagrant/bolt/bolt.yaml /root/.puppetlabs/bolt/bolt.yaml