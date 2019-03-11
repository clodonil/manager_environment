#!/bin/bash

chmod +x /opt/app/run.py

nohup /opt/app/run.py &

listps=$(ps aux | grep run.py | wc -l)

if [ "$listps" == "2" ]; then
   echo "App rodando"
   exit 0
else
   echo "Problema ao iniciar App"
   exit -1
fi