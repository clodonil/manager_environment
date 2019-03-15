#!/bin/bash
 
token=$PT_token
 
TOKEN_ROOT='cca15941-7cc6-a8da-b52a-f6e28d51762f'
export VAULT_ADDR='http://fa163eefb108l01.ctsp.des.cloud.ihf:8200'
 
#login
/opt/vault/vault login -field='token_policies' -no-store -method=token $TOKEN_ROOT
 
#Revogando
/opt/vault/vault token revoke $token
