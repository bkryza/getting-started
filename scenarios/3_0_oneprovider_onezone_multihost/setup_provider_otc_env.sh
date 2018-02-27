#!/bin/bash

BG=$1

rhea() {
    echo "export PROVIDER_NAME='RHEA-OTC'"
    echo "export FQDN='68e44e56-machine.vms.nuv.la'"
    echo "export ZONE_FQDN='onezone.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

cnrs() {
    echo "export PROVIDER_NAME='CNRS-OTC'"
    echo "export FQDN='op-otc-cnrs.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-cnrs.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

cern() {
    echo "export PROVIDER_NAME='CERN-OTC'"
    echo "export FQDN='op-otc-cern.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-cern.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

desy() {
    echo "export PROVIDER_NAME='DESY-OTC'"
    echo "export FQDN='op-otc-desy.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-desy.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

embl() {
    echo "export PROVIDER_NAME='EMBL-OTC'"
    echo "export FQDN='op-otc-embl.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-embl.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

esrf() {
    echo "export PROVIDER_NAME='ESRF-OTC'"
    echo "export FQDN='op-otc-esrf.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-esrf.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

ifae() {
    echo "export PROVIDER_NAME='IFAE-OTC'"
    echo "export FQDN='op-otc-ifae.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-ifae.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

infn() {
    echo "export PROVIDER_NAME='INFN-OTC'"
    echo "export FQDN='op-otc-infn.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-infn.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

kit() {
    echo "export PROVIDER_NAME='KIT-OTC'"
    echo "export FQDN='op-otc-kit.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-kit.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

stfc() {
    echo "export PROVIDER_NAME='STFC-OTC'"
    echo "export FQDN='op-otc-stfc.stfc-hn.com'"
    echo "export ZONE_FQDN='onezone-stfc.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

surfsara() {
    echo "export PROVIDER_NAME='SURFSara-OTC'"
    echo "export FQDN='op-otc-surfsara.rhea-hn.com'"
    echo "export ZONE_FQDN='onezone-surfsara.rhea-hn.com'"
    mkdir -p /opt/oneprovider/persistence
    mkdir -p /opt/oneprovider/storage
}

IP=$(curl -sS http://ipinfo.io/ip)
GEO_LATITUDE=$(curl -s --get http://freegeoip.net/json/$IP | grep -Po '(?<="latitude":)[^,}]*')
GEO_LONGITUDE=$(curl -s --get http://freegeoip.net/json/$IP | grep -Po '(?<="longitude":)[^,}]*')

ADMIN_PASSWORD="$(openssl rand -hex 6)"
echo $ADMIN_PASSWORD > ~/.provider.password
echo "export ADMIN_PASSWORD=$ADMIN_PASSWORD"

echo "export GEO_LATITUDE=$GEO_LATITUDE"
echo "export GEO_LONGITUDE=$GEO_LONGITUDE"

$BG
