#!/bin/bash
 
app=$PT_app
tier=$PT_tier
node=$PT_node
 
TOKEN_ROOT='cca15941-7cc6-a8da-b52a-f6e28d51762f'
export VAULT_ADDR='http://fa163eefb108l01.ctsp.des.cloud.ihf:8200'
policy='{"path": { "$app/*": {"capabilities" : [ "list", "read" ] } } }'
 
#login
/opt/vault/vault login -field='token_policies' -method=token $TOKEN_ROOT  > /dev/null
 
#Criando Policy
echo $policy | /opt/vault/vault policy write "$app-$tier"  -
 
#criando o token
/opt/vault/vault token create -policy="$app-$tier" -display-name="$node-$app-$tier" -period=24h -renewable=false -field='token'

