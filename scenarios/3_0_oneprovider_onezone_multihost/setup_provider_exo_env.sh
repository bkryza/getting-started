#!/bin/bash

BG=$1

rhea() {
    echo "export PROVIDER_NAME='RHEA-EXOSCALE'"
    echo "export FQDN='68e44e56-machine.vms.nuv.la'"
}

cnrs() {
    echo "export PROVIDER_NAME='CNRS-EXOSCALE'"
    echo "export FQDN='op-exo-cnrs.rhea-hn.com'"
}

cern() {
    echo "export PROVIDER_NAME='CERN-EXOSCALE'"
    echo "export FQDN='op-exo-cern.rhea-hn.com'"
}

desy() {
    echo "export PROVIDER_NAME='DESY-EXOSCALE'"
    echo "export FQDN='op-exo-desy.hn.nuv.la'"
}

embl() {
    echo "export PROVIDER_NAME='EMBL-EXOSCALE'"
    echo "export FQDN='op-exo-embl.hn.nuv.la'"
}

esrf() {
    echo "export PROVIDER_NAME='ESRF-EXOSCALE'"
    echo "export FQDN='op-exo-esrf.rhea-hn.com'"
}

ifae() {
    echo "export PROVIDER_NAME='IFAE-EXOSCALE'"
    echo "export FQDN='op-exo-ifae.rhea-hn.com'"
}

infn() {
    echo "export PROVIDER_NAME='INFN-EXOSCALE'"
    echo "export FQDN='op-exo-infn.hn.nuv.la'"
}

kit() {
    echo "export PROVIDER_NAME='KIT-EXOSCALE'"
    echo "export FQDN='op-exo-kit.rhea-hn.com'"
}

stfc() {
    echo "export PROVIDER_NAME='STFC-EXOSCALE'"
    echo "export FQDN='op-exo-stfc.stfc-hn.com'"
}

surfsara() {
    echo "export PROVIDER_NAME='SURFSara-EXOSCALE'"
    echo "export FQDN='op-exo-surfsara.hn.nuv.la'"
}

mkdir -p /opt/oneprovider/persistence
mkdir -p /opt/oneprovider/storage

IP=$(curl -sS http://ipinfo.io/ip)
GEO_LATITUDE=$(curl -s --get http://freegeoip.net/json/$IP | grep -Po '(?<="latitude":)[^,}]*')
GEO_LONGITUDE=$(curl -s --get http://freegeoip.net/json/$IP | grep -Po '(?<="longitude":)[^,}]*')

ADMIN_PASSWORD="$(openssl rand -hex 6)"
echo $ADMIN_PASSWORD > ~/.provider.password
echo "export ADMIN_PASSWORD=$ADMIN_PASSWORD"

echo "export GEO_LATITUDE=$GEO_LATITUDE"
echo "export GEO_LONGITUDE=$GEO_LONGITUDE"

echo "export ZONE_FQDN='onezone.rhea-hn.com'"

$BG
