#!/usr/bin/env bash
sudo apt install openjdk-8-jdk
sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.deb -O elasticsearch.deb
sudo dpkg -i elasticsearch.deb
echo "Run bin/elasticsearch (or bin\elasticsearch.bat on Windows)"
echo "Run curl http://localhost:9200/ or Invoke-RestMethod http://localhost:9200 with PowerShell"