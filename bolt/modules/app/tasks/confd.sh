#!/usr/bin/env bash

env=$PT_environment
TOKEN=$PT_token

sed -i "s/env/$env/g" /etc/confd/conf.d/app.toml


/opt/confd/bin/confd -onetime -backend vault -node http://192.168.77.100:8200 -auth-type token -auth-token $TOKEN

retorno=$?


sed -i "s/$env/env/g" /etc/confd/conf.d/app.toml


exit $retorno
