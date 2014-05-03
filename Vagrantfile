# -*- encoding: utf-8 -*-
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :centos do |centos|
    centos.vm.box = "centos"
    centos.vm.box_url = "./centos.box"
    centos.vm.boot_timeout = 600

    # Define network config
    centos.vm.network :forwarded_port, guest: 80, host: 8080, host_ip: "127.0.0.1"
    # centos.vm.network :private_network, ip: "192.168.33.10"
    # centos.vm.network :public_network

    # Define ssh config
    centos.ssh.username = "vagrant"
    # centos.ssh.forward_agent = true

    # Define sync directory
    # centos.vm.synced_folder "../data", "/vagrant_data"

    # Define VM config
    #    centos.vm.provider :virtualbox do |vb|
    #      vb.gui = true
    #      # vb.customize ["modifyvm", :id, "--memory", "1024"]
    #    end

    # Define provision from chef
    #    centos.vm.provision :chef_solo do |chef|
    #      # chef.cookbooks_path = "../my-recipes/cookbooks"
    #      # chef.roles_path = "../my-recipes/roles"
    #      # chef.data_bags_path = "../my-recipes/data_bags"
    #      # chef.add_recipe "mysql"
    #      # chef.add_role "web"
    #      # chef.json = { :mysql_password => "foo" }
    #    end
  end
end
