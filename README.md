# Gestão de configuração de ambiente


![topologia](https://github.com/clodonil/manager_environment/blob/master/img/topologia.png)

Para avaliação das ferramentas de gestão de configuração abaixo, vamos precisar de uma infraestrutura com o vault e o Bolt.

| Software | Linux  | Windows | Vault |
|----------|--------------------------------|---------|-------|
|confd| <i class="fa fa-star fa-check">| <i class="fa fa-star fa-check">| <i class="fa fa-star fa-check"> ||
| 



Disponibilizei no repositório do git um `Vagrantfile` com toda a estrutura que precisamos e vamos utiliza-ló para provisionamento da infra.

## Infra
Fazendo o clone do projeto:

```bash
git clone https://github.com/clodonil/manager_environment.git
```

Iniciando o servidor do Vault:

```bash
$ vagrant up vault
$ vagrant up bolt
```

## Validando

Vamos acessar o vault e criar a estrutura necessária.

Acesse o sequinte endereço:

 >> http:// 192.168.77.100:8200
![vault](https://github.com/clodonil/manager_environment/blob/master/img/vault.png)

Para a experimentação das ferramentas, vamos precisar criar a seguinte estrutura no vault.

![estrutura](https://github.com/clodonil/manager_environment/blob/master/img/confs.png)



