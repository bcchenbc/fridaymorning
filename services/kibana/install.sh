#!/usr/bin/env bash
wget https://artifacts.elastic.co/downloads/kibana/kibana-6.3.2-amd64.deb -O kibana.deb
sudo dpkg -i kibana.deb
echo "Point your browser at port 5601 to access the Kibana UI. For example, localhost:5601 or http://YOURDOMAIN.com:5601."
