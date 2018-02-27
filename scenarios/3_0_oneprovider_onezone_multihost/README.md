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
cd getting-started/scenarios/3_0_oneprovider_onezone_multihost
git checkout rhea
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
cd getting-started/scenarios/3_0_oneprovider_onezone_multihost
git checkout rhea
eval $(./setup_provider_exo_env.sh  BG_NAME)  # or eval $(./setup_provider_otc_env.sh  BG_NAME)
./run_onedata --provider --detach
cat ~/.provider.password
```


