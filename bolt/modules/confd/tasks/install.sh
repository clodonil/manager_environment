#!/bin/bash

yum install install wget -y
wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64

mkdir -p /opt/confd/bin
mv confd-0.16.0-linux-amd64 /opt/confd/bin/confd
chmod +x /opt/confd/bin/confd
sudo mkdir -p /etc/confd/{conf.d,templates}


export PATH="$PATH:/opt/confd/bin"

confd --version

RC=$?

if [ "$RC" == "0" ]; then
   echo "Pacote confd instalado com sucesso"
else
   echo "Erro ao instalar o confd"
fi

exit $RC