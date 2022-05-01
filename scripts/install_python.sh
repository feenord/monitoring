#! /bin/bash
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.service
sudo systemctl stop apt-daily-upgrade.service
sleep 20
sudo apt-get update -y
sudo apt-get install -y git
git clone -b master https://github.com/feenord/search_engine_crawler.git
cd search_engine_crawler
sudo apt-get install python -y
sudo apt-get -y install python3-pip 
sudo pip3 install -r requirements.txt
sudo apt-get install rabbitmq-server -y
sudo systemctl enable rabbitmq-server
sudo systemctl start rabbitmq-server
sudo systemctl status rabbitmq-server
sudo apt-get install mc -y
cp ./scripts/crawler.service /etc/systemd/system/
sudo systemctl enable crawler.service
sudo systemctl start crawler.service
sudo systemctl status crawler.service 
echo -ok
