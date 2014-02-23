# -*- encoding: utf-8 -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   config.vm.box = "centos"
   config.vm.box_url = "./centos.box"
   config.vm.boot_timeout = 600

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  # config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.network :public_network

   config.ssh.username = "vagrant"
   # config.ssh.forward_agent = true

   # config.vm.synced_folder "../data", "/vagrant_data"

   config.vm.provider :virtualbox do |vb|
	  vb.gui = true
	  # vb.customize ["modifyvm", :id, "--memory", "1024"]
   end

   config.vm.provision :chef_solo do |chef|
	  # chef.cookbooks_path = "../my-recipes/cookbooks"
	  # chef.roles_path = "../my-recipes/roles"
	  # chef.data_bags_path = "../my-recipes/data_bags"
	  # chef.add_recipe "mysql"
	  # chef.add_role "web"
	  # chef.json = { :mysql_password => "foo" }
   end
end
