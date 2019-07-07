#!/bin/bash
#rsyslog configuratie MASTER

#installatie rsyslog
sudo apt-get install rsyslog -y

#extra folder aanmaken voor backup config file
sudo mkdir /etc/backup_rsyslog

#verplaatsen naar nieuw aangemaakte folder en renamen voor backup
sudo mv /etc/rsyslog.conf /etc/backup_rsyslog/rsyslog.conf_back

#configuratie die klaar staat op git voor rsyslog kopieren naar /etc/rsyslog
sudo cp /home/joostholwerda/git/linux-herkansing/rsyslog_master_config/rsyslog.conf /etc/rsyslog.conf

#stop start om te restarten
sudo systemctl stop rsyslog
sudo systemctl start rsyslog

#status voor gebruiker
sudo systemctl status rsyslog


echo "location stored logs: /var/log/saved_logs.log " 