#!/usr/bin/env bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.3.2.deb -O elasticsearch.deb
sudo dpkg -i elasticsearch.deb
echo "Run bin/elasticsearch (or bin\elasticsearch.bat on Windows)"
echo "Run curl http://localhost:9200/ or Invoke-RestMethod http://localhost:9200 with PowerShell"