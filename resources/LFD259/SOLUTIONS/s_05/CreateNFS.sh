#!/bin/bash
#/* **************** LFD259:2020-06-18 s_05/CreateNFS.sh **************** */
#/*
# * The code herein is: Copyright the Linux Foundation, 2020
# *
# * This Copyright is retained for the purpose of protecting free
# * redistribution of source.
# *
# *     URL:    https://training.linuxfoundation.org
# *     email:  training@linuxfoundation.org
# *
# * This code is distributed under Version 2 of the GNU General Public
# * License, which you should have received with the source.
# *
# */
sudo apt-get update && sudo apt-get install -y nfs-kernel-server

sudo mkdir /opt/sfw

sudo chmod 1777 /opt/sfw/

sudo bash -c "echo software > /opt/sfw/hello.txt"

sudo bash -c "echo '/opt/sfw/ *(rw,sync,no_root_squash,subtree_check)' >> /etc/exports"

sudo exportfs -ra

echo
echo "Should be ready. Test here and second node"
echo

sudo showmount -e localhost

