#!/usr/bin/env bash
sudo apt-get install -y python3-pip
sudo pip3 install docker pymysql celery \
    apache-airflow \
    apache-airflow[crypto] \
    apache-airflow[ldap] \
    apache-airflow[mysql] \
    apache-airflow[rabbitmq] \
    apache-airflow[s3] \
    apache-airflow[slack] \
    apache-airflow[redis]

wget -O - 'https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc' | sudo apt-key add -
echo "deb http://dl.bintray.com/rabbitmq/debian $(lsb_release -sc) erlang main" | sudo tee /etc/apt/sources.list.d/bintray.list
sudo apt-get update && sudo apt-get install -y erlang-nox rabbitmq-server
