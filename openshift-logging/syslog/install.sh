#!/bin/bash

sudo hostnamectl set-hostname syslog
sudo apt update && sudo apt upgrade -y
sudo apt list -a rsyslog
sudo apt install rsyslog -y
sudo systemctl enable --now rsyslog
sudo systemctl status rsyslog
sudo vim /etc/rsyslog.conf
sudo systemctl restart rsyslog
sudo systemctl status rsyslog
ss -anlp | grep 514
rsyslogd -f /etc/rsyslog.conf -N1
tail -f /var/log/syslog
ls -lh /var/log/syslog
