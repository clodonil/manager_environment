#!/usr/bin/env bash

echo your message is $PT_message


env=$PT_environment
TOKEN=$PT_token

sed -e "s/env/$env/g' /etc/conf.d/app.toml


confd -onetime -backend vault -node http://192.168.77.100:8200 \
      -auth-type token -auth-token $TOKEN