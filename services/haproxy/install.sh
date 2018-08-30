#!/usr/bin/env bash
curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent2.sh | sh
sudo td-agent-gem install fluent-plugin-influxdb fluent-plugin-rewrite-tag-filter fluent-plugin-prometheus

sudo apt-get update && sudo apt-get install -y haproxy
