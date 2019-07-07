#!/bin/bash
# copy files from git location to salt location

sudo cp /home/joostholwerda/git/linux-herkansing/salt/top.sls /srv/salt/
sudo cp /home/joostholwerda/git/linux-herkansing/salt/app.sls /srv/salt/
sudo cp /home/joostholwerda/git/linux-herkansing/salt/docker.sls /srv/salt/

#restart salt services
sudo systemctl stop salt-master
sudo systemctl start salt-master
sudo systemctl status salt-master