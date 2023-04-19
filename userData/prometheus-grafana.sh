#!/bin/bash
cd /opt
wget https://github.com/prometheus/prometheus/releases/download/v2.39.1/prometheus-2.39.1.linux-amd64.tar.gz
tar -xvzf prometheus-2.39.1.linux-amd64.tar.gz
cd prometheus-2.39.1.linux-amd64/
nohup ./prometheus &
cd /opt
wget https://dl.grafana.com/oss/release/grafana-9.2.1.linux-amd64.tar.gz
tar -xvzf grafana-9.2.1.linux-amd64.tar.gz
chmod -R 755 grafana-9.2.1
cd grafana-9.2.1/bin/
nohup ./grafana-server &
