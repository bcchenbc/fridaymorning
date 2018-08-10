#!/usr/bin/env bash
sudo apt install openjdk-8-jdk
sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
wget https://artifacts.elastic.co/downloads/logstash/logstash-6.3.2.deb -O logstash.deb
sudo dpkg -i logstash.deb
echo "Create a file named \"logstash-simple.conf\" and save it in the same directory as Logstash."
echo "
input { stdin { } }
output {
  elasticsearch { hosts => [\"localhost:9200\"] }
  stdout { codec => rubydebug }
}
"