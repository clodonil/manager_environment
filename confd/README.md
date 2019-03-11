# Confd

## Features

## Laboratório

Para realizar o laboratório é necessário ter o Vault instalado e com as configurações dos segredos e também o bolt.

Qualquer dúvida leia novamente esses [passos](https://github.com/clodonil/manager_environment/blob/master/README.md).

No diretório `confd` inicie a VM do node.

```bash
vagrant up 
```

Agora volte para o diretório do projeto e entre na VM do bolt. Toda ação será realizada da máquina do bolt, em nenhum momento vamos entrar na VM do node.

Na máquina do bolt, primeiro realize os seguintes testes de conexão:

### Validando a conexão entre o bolt e o node

Primeiramente vamos realizar um `ping` para validar a conectividade.

```bash
[root@bolt ~]# ping 192.168.77.10
PING 192.168.77.10 (192.168.77.10) 56(84) bytes of data.
64 bytes from 192.168.77.10: icmp_seq=1 ttl=64 time=0.619 ms
64 bytes from 192.168.77.10: icmp_seq=2 ttl=64 time=0.562 ms
64 bytes from 192.168.77.10: icmp_seq=3 ttl=64 time=0.615 ms
^C
--- 192.168.77.10 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2000ms
rtt min/avg/max/mdev = 0.562/0.598/0.619/0.038 ms
```

Com a conectividade, vamos executar uma tarefa como bolt.

```bash
[root@bolt ~]# bolt command run 'cat /etc/passwd' --node 192.168.77.10
Started on 192.168.77.10...
Finished on 192.168.77.10:
  STDOUT:
    root:x:0:0:root:/root:/bin/bash
    bin:x:1:1:bin:/bin:/sbin/nologin
    daemon:x:2:2:daemon:/sbin:/sbin/nologin
    adm:x:3:4:adm:/var/adm:/sbin/nologin
    lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
    sync:x:5:0:sync:/sbin:/bin/sync
    shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
    halt:x:7:0:halt:/sbin:/sbin/halt
    mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
    operator:x:11:0:operator:/root:/sbin/nologin
    games:x:12:100:games:/usr/games:/sbin/nologin
    ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
    nobody:x:99:99:Nobody:/:/sbin/nologin
    systemd-network:x:192:192:systemd Network Management:/:/sbin/nologin
    dbus:x:81:81:System message bus:/:/sbin/nologin
    polkitd:x:999:998:User for polkitd:/:/sbin/nologin
    rpc:x:32:32:Rpcbind Daemon:/var/lib/rpcbind:/sbin/nologin
    rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
    nfsnobody:x:65534:65534:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
    sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
    postfix:x:89:89::/var/spool/postfix:/sbin/nologin
    chrony:x:998:996::/var/lib/chrony:/sbin/nologin
    vagrant:x:1000:1000:vagrant:/home/vagrant:/bin/bash
Successful on 1 node: 192.168.77.10
Ran on 1 node in 0.62 seconds
```

A instalação do confd 

```bash
bolt task run confd::install --nodes 192.168.77.10
```
instalando as dependências da aplicação

```bash
bolt task run app::install_infra --nodes 192.168.77.10
```

```bash
bolt file upload 'app.tar.gz' '/opt/app.tar.gz' --nodes 192.168.77.10
```
