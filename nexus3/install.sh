#!/bin/bash

um install -y wget 
yum install -y java-1.8.0-openjdk-devel

wget http://download.sonatype.com/nexus/3/latest-unix.tar.gz
sudo tar xvf latest-unix.tar.gz -C /opt
mv /opt/nexus-* /opt/nexus

sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus

 echo 'run_as_user="nexus"' > /opt/nexus/bin/nexus.rc 

/opt/nexus/bin/nexus start
