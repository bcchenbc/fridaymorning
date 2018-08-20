#!/usr/bin/env bash
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.2.2_amd64.deb -O grafana.deb && sudo dpkg -i grafana.deb

# sudo hostnamectl set-hostname dashboard
# sudo nano /etc/hosts

docker stop webservice00 && docker rm webservice00 && docker run -d -p 10000:80 --name webservice00 helloflask:eb85da25