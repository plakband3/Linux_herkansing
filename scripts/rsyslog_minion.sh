#!/bin/bash

# install rsyslog for minion
# this requires IP logserver

# variablen:
# $ip_address

echo "Tijd om Rsyslog client te installeren."
echo "Voer aub IP address in van de logserver: "
read ip_address

#install rsyslog
sudo apt-get install rsyslog -y

# move old rsyslog.conf to backup
sudo mv /etc/rsyslog.conf /etc/rsyslog.conf_back

LOCATION="/etc/rsyslog.conf"

/bin/cat << EOM >$LOCATION
# MINION
#  /etc/rsyslog.conf    Configuration file for rsyslog.
#
#                       For more information see
#                       /usr/share/doc/rsyslog-doc/html/rsyslog_conf.html
#
#  Default logging rules can be found in /etc/rsyslog.d/50-default.conf


#################
#### MODULES ####
#################

module(load="imuxsock") # provides support for local system logging
#module(load="immark")  # provides --MARK-- message capability

# provides UDP syslog reception
#module(load="imudp")
#input(type="imudp" port="514")

# provides TCP syslog reception
#module(load="imtcp")
#input(type="imtcp" port="514")

# provides kernel logging support and enable non-kernel klog messages
module(load="imklog" permitnonkernelfacility="on")

###########################
#### GLOBAL DIRECTIVES ####
###########################

#
# Use traditional timestamp format.
# To enable high precision timestamps, comment out the following line.
#
$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

# Filter duplicated messages
$RepeatedMsgReduction on

#
# Set the default permissions for all log files.
#
$FileOwner syslog
$FileGroup adm
$FileCreateMode 0640
$DirCreateMode 0755
$Umask 0022
$PrivDropToUser syslog
$PrivDropToGroup syslog

#
# Where to place spool and state files
#
$WorkDirectory /var/spool/rsyslog

#
# Include all config files in /etc/rsyslog.d/
#
$IncludeConfig /etc/rsyslog.d/*.conf

#$PreserveFQDN on

*.* @$ip_address:514
#*.* @fqdn-of-rsysog-server:514

*.* @$ip_address:514
#*.* ##fqdn-of-rsysog-server:514

$ActionQueueFileName queue
$ActionQueueMaxDiskSpace 1g
$ActionQueueSaveOnShutdown on
$ActionQueueType LinkedList
$ActionResumeRetryCount -1

EOM


#restart rsyslog services

sudo systemctl stop rsyslog
sudo systemctl start rsyslog

echo "Rsyslog is geconfigureerd" 
echo "Bekijk logs vanaf de master op: /var/log/saved_logs.log


#END