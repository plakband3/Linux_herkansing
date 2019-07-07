#!/bin/bash
# script to install munin on a node
# pain in the ass for the special notation ip address.
# no problem.

echo "Voer aub ip address in van Munin Master. "
read ip_address

A="$(cut -d'.' -f1 <<<$ip_address)"
B="$(cut -d'.' -f2 <<<$ip_address)"
C="$(cut -d'.' -f3 <<<$ip_address)"
D="$(cut -d'.' -f4 <<<$ip_address)"


# install muning node
sudo apt-get install munin-node -y

# move old munin-node.conf to backup
sudo mv /etc/munin/munin-node.conf /etc/munin/munin-node.conf_back

LOCATION="/etc/munin/munin-node.conf"

/bin/cat << EOM >$LOCATION
#MINION
#/etc/munin/munin-node.conf

#
# Example config-file for munin-node
#

log_level 4
log_file /var/log/munin/munin-node.log
pid_file /var/run/munin/munin-node.pid

background 1
setsid 1

user root
group root

# This is the timeout for the whole transaction.
# Units are in sec. Default is 15 min
#
# global_timeout 900

# This is the timeout for each plugin.
# Units are in sec. Default is 1 min
#
# timeout 60

# Regexps for files to ignore
ignore_file [\#~]$
ignore_file DEADJOE$
ignore_file \.bak$
ignore_file %$
ignore_file \.dpkg-(tmp|new|old|dist)$
ignore_file \.rpm(save|new)$
ignore_file \.pod$

# Set this if the client doesn't report the correct hostname when
# telnetting to localhost, port 4949
#
#host_name localhost.localdomain

# A list of addresses that are allowed to connect.  This must be a
# regular expression, since Net::Server does not understand CIDR-style
# network notation unless the perl module Net::CIDR is installed.  You
# may repeat the allow line as many times as you'd like

allow ^$A\.$B\.$C\.$D$
allow ^::1$
port 4949

# If you have installed the Net::CIDR perl module, you can use one or more
# cidr_allow and cidr_deny address/mask patterns.  A connecting client must
# match any cidr_allow, and not match any cidr_deny.  Note that a netmask
# *must* be provided, even if it's /32
#
# Example:
#
# cidr_allow 127.0.0.1/32
# cidr_allow 192.0.2.0/24
# cidr_deny  192.0.2.42/32

# Which address to bind to;
host *
# host 127.0.0.1

# And which port
port 4949

EOM

sudo service munin-node stop
sudo service munin-node start

echo "Munin-Node geinstalleerd"
