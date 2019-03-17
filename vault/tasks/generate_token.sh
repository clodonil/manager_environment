#!/bin/bash

TOKEN_ROOT=$PT_token
VAULT=$PT_vault 
app=$PT_app
tier=$PT_tier
node=$PT_node
 
export VAULT_ADDR="http://$VAULT:8200"
policy='{"path": { "$app/*": {"capabilities" : [ "list", "read" ] } } }'
 
#login
/opt/vault/vault login -field='token_policies' -method=token $TOKEN_ROOT  > /dev/null
 
#Criando Policy
echo $policy | /opt/vault/vault policy write "$app-$tier"  -
 
#criando o token
/opt/vault/vault token create -policy="$app-$tier" -display-name="$node-$app-$tier" -period=24h -renewable=false -field='token'

