#!/bin/bash
 
tier=$PT_tier
token =$PT_token
url="http://fa163eefb108l01.ctsp.des.cloud.ihf:8200"
 
RC=1
 
if [ ! -z "$tier" ]; then
 
   sed -i  "s/tier/$tier/g" /etc/confd/conf.d/app_properties.toml
   sed -i  "s/tier/$tier/g" /etc/confd/conf.d/poc_repo.toml
 
 
   /opt/confd/bin/confd -onetime -config-file app_properties.toml -backend vault -node $url -auth-type token -auth-token $token
 
   RC=$?
 
   sed -i  "s/$tier/tier/g" /etc/confd/conf.d/app_properties.toml
   sed -i  "s/$tier/tier/g" /etc/confd/conf.d/poc_repo.toml
fi
 
if [ "$RC" != "0" ]; then echo "deploy failed"; echo RC=$RC; exit $RC; fi
