# Confd

| Parâmetros | Descrição |
|------------|-----------|
|-app-id string| Vault app-id to use with the app-id backend (only used with -backend=vault and auth-type=app-id) |
|-auth-token string |
    	Auth bearer token to use
|-auth-type string |
    	Vault auth backend type to use (only used with -backend=vault)
|-backend string |
    	backend to use (default "etcd")
|-basic-auth |
    	Use Basic Auth to authenticate (only used with -backend=consul and -backend=etcd)
|-client-ca-keys string |
    	client ca keys
|-client-cert string |
    	the client cert
|-client-key string |
    	the client key
|-confdir string |
    	confd conf directory (default "/etc/confd")
|-config-file string |
    	the confd config file (default "/etc/confd/confd.toml")
|-file value |
    	the YAML file to watch for changes (only used with -backend=file)
|-filter string |
    	files filter (only used with -backend=file) (default "*")
|-interval int |
    	backend polling interval (default 600)
|-keep-stage-file |
    	keep staged files
|-log-level string |
    	level which confd should log messages
|-node value |
    	list of backend nodes
|-noop |
    	only show pending changes
|-onetime |
    	run once and exit
|-password string |
    	the password to authenticate with (only used with vault and etcd backends)
|-path string |
    	Vault mount path of the auth method (only used with -backend=vault)
|-prefix string |
    	key path prefix
|-role-id string |
    	Vault role-id to use with the AppRole, Kubernetes backends (only used with -backend=vault and either auth-type=app-role or auth-type=kubernetes)
|-scheme string |
    	the backend URI scheme for nodes retrieved from DNS SRV records (http or https) (default "http")
|-secret-id string |
    	Vault secret-id to use with the AppRole backend (only used with -backend=vault and auth-type=app-role)
|-secret-keyring string |
    	path to armored PGP secret keyring (for use with crypt functions)
|-separator string |
    	the separator to replace '/' with when looking up keys in the backend, prefixed '/' will also be removed (only used with -backend=redis)|
|-srv-domain string |the name of the resource record|
|-srv-record string |the SRV record to search for backends nodes. Example: _etcd-client._tcp.example.com |
|-sync-only | sync without check_cmd and reload_cmd |
|-table string | the name of the DynamoDB table (only used with -backend=dynamodb) |
|-user-id string | Vault user-id to use with the app-id backend (only used with -backend=value and auth-type=app-id)|
|-username string | the username to authenticate as (only used with vault and etcd backends) |
|-version | print version and exit|
|-watch | enable watch support|


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
bolt file upload '/vagrant/bolt/modules/app/files/app.zip' '/opt/app.zip' --nodes 192.168.77.10
```

```bash
bolt task run app::install_app --nodes 192.168.77.10
```

```bash
bolt task run app::confd  environment="dev" token="redepp" --nodes 192.168.77.10 
```

```bash
bolt task run app::startApp  --nodes 192.168.77.10 
```
