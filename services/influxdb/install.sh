# sudo fdisk /dev/nvme1n1
# sudo mkfs.ext4 /dev/nvme1n1p1
# sudo hostnamectl set-hostname influxdb
# sudo nano /etc/hosts
# sudo mount /dev/nvme1n1p1 /DB
# sudo chown influxdb /DB
# sudo nano /etc/influxdb/influxdb.conf
# influx
# CREATE DATABASE fluentd
# SHOW DATABASES
#!/usr/bin/env bash
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.6.1_amd64.deb -O influxdb.deb && sudo dpkg -i influxdb.deb

