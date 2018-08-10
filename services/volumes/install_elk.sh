#!/usr/bin/env bash
sudo mkdir /D
sudo chown $USER /D
sudo mkdir /P
sudo chown $USER /P

sudo apt update
sudo apt install openjdk-8-jdk
sudo update-java-alternatives -s java-1.8.0-openjdk-amd64

EL_TAR_URL=https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.tar.gz
KN_TAR_URL=https://artifacts.elastic.co/downloads/kibana/kibana-6.3.2-linux-x86_64.tar.gz
LS_TAR_URL=https://artifacts.elastic.co/downloads/logstash/logstash-6.3.2.tar.gz
FB_TAR_URL=https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.3.2-linux-x86_64.tar.gz

EL_DIR=$(basename $EL_TAR_URL | sed 's/.tar.gz//')
KN_DIR=$(basename $KN_TAR_URL | sed 's/.tar.gz//')
LS_DIR=$(basename $LS_TAR_URL | sed 's/.tar.gz//')
FB_DIR=$(basename $FB_TAR_URL | sed 's/.tar.gz//')


wget $EL_TAR_URL -O elasticsearch.tar.gz
wget $KN_TAR_URL -O kibana.tar.gz
wget $LS_TAR_URL -O logstash.tar.gz
wget $FB_TAR_URL -O filebeat.tar.gz

tar -xf elasticsearch.tar.gz -C /P
tar -xf kibana.tar.gz -C /P
tar -xf logstash.tar.gz -C /P
tar -xf filebeat.tar.gz -C /P


cd /P
ln -s $EL_DIR elasticsearch
ln -s $KN_DIR kibana
ln -s $LS_DIR logstash
ln -s $FB_DIR filebeat