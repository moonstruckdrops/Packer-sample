# -*- coding: utf-8 -*-
#
# Cookbook Name:: moonstruckdrops
# Recipe:: default
#
# Copyright 2014, moonstruckdrops
#
# All rights reserved - Do Not Redistribute
#

include_recipe "moonstruckdrops::ruby"

# 共有ディレクトリ
%w{gcc make kernel-devel}.each do |package|
   yum_package package do
	  action :install
   end
end

execute "mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt" do
   command "mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt"
   action :run
end

execute "sh /mnt/VBoxLinuxAdditions.run install" do
   command "sh /mnt/VBoxLinuxAdditions.run install"
   action :run
   ignore_failure true
end

execute "umount /mnt" do
   command "umount /mnt"
   action :run
end

directory "/vagrant" do
   mode 0700
   owner "vagrant"
   group "vagrant"
   action :create
end
