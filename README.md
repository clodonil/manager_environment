# Gestão de configuração de ambiente

Nesse Post vamos avaliar algumas soluções de gestão de configuração como parte de uma solução de deploy.

Portanto uma mesma aplicação, deve evoluir em ambientes como `development`, `homolog` e `production` e suas configurações são aplicadas conforme o ambiente(`Environment`).

Para realizar essa tarefa, vamos escrever uma aplicação (hello Word) simples em Flask (Python) que mostra na tela as variáveis que estão sendo utilizada.

Vamos utilizar o [vault](https://www.vaultproject.io/) para armazenar os segredos/variáveis de ambiente e o [Bolt](https://puppet.com/docs/bolt/latest/bolt_installing.html) para aplicar as configurações utilizando alguma solução de gestão de configuração.  

A topologia abaixo demostra a forma que será utilizado.

![topologia](https://github.com/clodonil/manager_environment/blob/master/img/topologia.png)

1. Bolt: Instala o app e aciona o software de gestão de configuração;
2. Node: Através do bolt, o node utiliza o software de gestão de configuração e consulta o vault.
3. Vault: Valida o token da consulta e devolve as configurações;
4. Node: Recebe as configurações do vault e realiza ajusta a configuração da aplicação
5. Node: Através do bolt, aplicação é inicializada. 

As ferramentas de configuração que foram avaliadas são essas. Click nelas para ter mais detalhe da experimentação.

| Software | Linux  | Windows | Vault | 
|----------|--------|---------|-------|
|[confd](confd/README.md)     |        |         |       | 

Para avaliação das ferramentas de gestão de configuração, foi necessário instalar o vault e o bolt.

Disponibilizei no repositório do git um `Vagrantfile` com toda a estrutura que precisamos e vamos utiliza-ló para provisionamento da infra.

## Infra
Fazendo o clone do projeto:

```bash
git clone https://github.com/clodonil/manager_environment.git
```

Iniciando o servidor do Vault:

```bash
vagrant up vault
vagrant up bolt
```

## Validando

Vamos acessar o vault e criar a estrutura necessária.

Acesse o sequinte endereço:

 > http:// 192.168.77.100:8200
 
Acesso ao vault:

Token: redepp

![vault](https://github.com/clodonil/manager_environment/blob/master/img/vault.png)

Para a experimentação das ferramentas, vamos precisar criar a seguinte estrutura no vault.

![estrutura](https://github.com/clodonil/manager_environment/blob/master/img/confs.png)



