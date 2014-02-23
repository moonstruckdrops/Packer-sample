# -*- coding: utf-8 -*-
#
# Cookbook Name:: moonstruckdrops
# Recipe:: ruby
#
# Copyright 2014, moonstruckdrops
#
# All rights reserved - Do Not Redistribute
#


RUBY_VERSION = "2.0.0-p353"

# Install packages for Ruby
%w{make gcc zlib-devel openssl-devel readline-devel ncurses-devel gdbm-devel db4-devel libffi-devel tk-devel git}.each do |package|
   yum_package package do
 	  action :install
   end
end

# Install epel repo
execute "rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm" do
   command "rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm"
   action :run
end

execute "sed -i \"s%enabled=1%enabled=0%g\" /etc/yum.repos.d/epel.repo" do
   command "sed -i \"s%enabled=1%enabled=0%g\" /etc/yum.repos.d/epel.repo"
   action :run
end

yum_package "libyaml-devel" do
   options "--enablerepo=epel"
   action :install
end


# Setup rbenv
git "/usr/local/rbenv" do
   repository "git://github.com/sstephenson/rbenv.git"
   reference "master"
   action :sync
end

# ディレクトリが存在しないとエラーになるので作成する
%w{/usr/local/rbenv/shims /usr/local/rbenv/versions}.each do |dir|
   directory dir do
	  action :create
   end
end

git "/usr/local/ruby-build" do
   repository "git://github.com/sstephenson/ruby-build.git"
   reference "master"
   action :sync
end

bash "install_ruby_build" do
   cwd "/usr/local/ruby-build"
   code <<-EOH
     ./install.sh
   EOH
end

template "rbenv.sh" do
   path "/etc/profile.d/rbenv.sh"
   owner "root"
   group "root"
   mode "0644"
   source "rbenv.sh"
end

# Install Ruby2.0 p353
execute "rbenv install #{RUBY_VERSION}" do
   command "source /etc/profile.d/rbenv.sh; /usr/local/rbenv/bin/rbenv install #{RUBY_VERSION}"
   action :run
end

execute "rbenv global #{RUBY_VERSION}" do
   command "source /etc/profile.d/rbenv.sh; /usr/local/rbenv/bin/rbenv global #{RUBY_VERSION}"
   action :run
end

execute "rbenv rehash" do
   command "source /etc/profile.d/rbenv.sh; /usr/local/rbenv/bin/rbenv rehash"
   action :run
end
