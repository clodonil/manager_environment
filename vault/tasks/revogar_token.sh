#!/bin/bash
 
token=$PT_token
TOKEN_ROOT=$PT_token
VAULT=$PT_vault 

 
export VAULT_ADDR="http://$VAULT:8200"
 
#login
/opt/vault/vault login -field='token_policies' -no-store -method=token $TOKEN_ROOT
 
#Revogando
/opt/vault/vault token revoke $token
