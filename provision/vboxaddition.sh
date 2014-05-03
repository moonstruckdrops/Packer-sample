#!/bin/sh

sudo mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run install
sudo umount /mnt
