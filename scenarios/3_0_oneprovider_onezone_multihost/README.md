## Setup packages

```
yum install git wget curl
curl -fsSL get.docker.com -o get-docker.sh
bash ./get-docker.sh
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod a+x /usr/local/bin/docker-compose
systemctl start docker
```


## Setup certs

### Centos
```
sudo yum install certbot 
sudo certbot certonly --standalone -d DOMAIN_NAME
```

### Ubuntu
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot
sudo certbot certonly --standalone -d DOMAIN_NAME
```



## Setup Onezone instance

```
git clone https://github.com/bkryza/getting-started
cd getting-started
git checkout rhea
cd scenarios/3_0_oneprovider_onezone_multihost
eval $(./setup_zone_env.sh BG_NAME)
echo $ZONE_NAME # check if name is correct
cp auth.config /opt/onezone/auth.config
vim /opt/onezone/auth.config
# Edit auth.config with proper realm URL and app_secret
./run_onedata --provider --detach
cat ~/.zone.password
```


## Setup Oneprovider instance
```
git clone https://github.com/bkryza/getting-started
cd getting-started
git checkout rhea
cd scenarios/3_0_oneprovider_onezone_multihost
eval $(./setup_provider_exo_env.sh  BG_NAME)  # or eval $(./setup_provider_otc_env.sh  BG_NAME)
./run_onedata --provider --detach
cat ~/.provider.password
```


