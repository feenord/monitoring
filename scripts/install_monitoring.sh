#! /bin/bash
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service
sudo systemctl stop apt-daily-upgrade.service
sleep 20
sudo apt-get update -y
sudo apt-get install git -y
git clone -b main https://github.com/feenord/monitoring.git
cd ./monitoring/
sudo mkdir -p /etc/prometheus
sudo mkdir -p /var/lib/prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.31.0/prometheus-2.31.0.linux-amd64.tar.gz
tar -xvf prometheus-2.31.0.linux-amd64.tar.gz
cp ./scripts/prometheus.service /etc/systemd/system/prometheus.service
cd prometheus-2.31.0.linux-amd64 
sudo mv prometheus promtool /usr/local/bin/
sudo mv consoles/ console_libraries/ /etc/prometheus/
sudo mv prometheus.yml /etc/prometheus/prometheus.yml
prometheus --version
promtool --version
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/ /var/lib/prometheus/
sudo chmod -R 775 /etc/prometheus/ /var/lib/prometheus/
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus
