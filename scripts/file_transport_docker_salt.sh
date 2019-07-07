#!/bin/bash
# copy files from git location to salt location

sudo mkdir /srv/salt
sudo cp /home/joostholwerda/git/linux-herkansing/salt/top.sls /srv/salt/top.sls
sudo cp /home/joostholwerda/git/linux-herkansing/salt/app.sls /srv/salt/app.sls
sudo cp /home/joostholwerda/git/linux-herkansing/salt/docker.sls /srv/salt/docker.sls
sudo cp /home/joostholwerda/git/linux-herkansing/salt/docker.list /srv/salt/docker.list

#restart salt services
sudo systemctl stop salt-master
sudo systemctl start salt-master
sudo systemctl status salt-master

# END