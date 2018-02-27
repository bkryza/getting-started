#!/bin/bash

BG=$1

rhea() {
    echo "export ZONE_NAME='RHEA'"
    echo "export FQDN='onezone.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

cnrs() {
    echo "export ZONE_NAME='CNRS'"
    echo "export FQDN='onezone-cnrs.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

cern() {
    echo "export ZONE_NAME='CERN'"
    echo "export FQDN='onezone-cern.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

desy() {
    echo "export ZONE_NAME='DESY'"
    echo "export FQDN='onezone-desy.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

embl() {
    echo "export ZONE_NAME='EMBL'"
    echo "export FQDN='onezone-embl.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

esrf() {
    echo "export ZONE_NAME='ESRF'"
    echo "export FQDN='onezone-embl.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

ifae() {
    echo "export ZONE_NAME='IFAE'"
    echo "export FQDN='onezone-ifae.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

infn() {
    echo "export ZONE_NAME='INFN'"
    echo "export FQDN='onezone-infn.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

kit() {
    echo "export ZONE_NAME='KIT'"
    echo "export FQDN='onezone-kit.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

stfc() {
    echo "export ZONE_NAME='STFC'"
    echo "export FQDN='onezone-stfc.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

surfsara() {
    echo "export ZONE_NAME='SURFSara'"
    echo "export FQDN='onezone-surfsara.rhea-hn.com'"
    mkdir -p /opt/onezone/persistence
}

IP=$(curl -sS http://ipinfo.io/ip)
GEO_LATITUDE=$(curl -s --get http://freegeoip.net/json/$IP | grep -Po '(?<="latitude":)[^,}]*')
GEO_LONGITUDE=$(curl -s --get http://freegeoip.net/json/$IP | grep -Po '(?<="longitude":)[^,}]*')

ADMIN_PASSWORD="$(openssl rand -hex 6)"
echo $ADMIN_PASSWORD > ~/.zone.password
echo "export ADMIN_PASSWORD=$ADMIN_PASSWORD"

echo "export GEO_LATITUDE=$GEO_LATITUDE"
echo "export GEO_LONGITUDE=$GEO_LONGITUDE"

echo "export ADMIN_PASSWORD=$ADMIN_PASSWORD"

$BG

cp auth.config /opt/onezone
