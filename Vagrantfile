# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.define :postgres do |node|
    node.vm.box = "kaorimatz/centos-6.8-x86_64"
    node.vm.network :private_network, ip: "192.168.56.102"
    node.vm.network "public_network", :bridge => "eth3", ip:"192.168.131.17", :auto_config => "false", :netmask => "255.255.255.0"
    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "4", "--name", "postgres" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "postgres"
      chef.json ={"aptmirror" => {"server" => "192.168.131.254"}}
    end
  end  
  config.vm.define :sinatra do |node|
    node.vm.box = "kaorimatz/centos-6.8-x86_64"
    node.vm.network :private_network, ip: "192.168.56.101"
    node.vm.network "public_network", :bridge => "eth3", ip:"192.168.131.16", :auto_config => "false", :netmask => "255.255.255.0"
    node.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "4", "--name", "sinatra" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "sinatra"
      chef.json ={"aptmirror" => {"server" => "192.168.131.254"}}
    end
  end
  r
end
