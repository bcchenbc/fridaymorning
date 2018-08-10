wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.3.2-amd64.deb -O filebeat.deb
sudo dpkg -i filebeat.deb
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-6.3.2-amd64.deb -O metricbeat.deb
sudo dpkg -i metricbeat.deb
echo "To configure Filebeat, you edit the configuration file."
echo "For rpm and deb, you’ll find the configuration file at /etc/filebeat/filebeat.yml."
echo "Under Docker, it’s located at /usr/share/filebeat/filebeat.yml"
echo "https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-configuration.html for detail."