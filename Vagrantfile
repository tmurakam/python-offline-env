# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/centos7"
  #config.vm.box = "generic/ubuntu1804"

  # config.vm.box_check_update = false
  config.vm.hostname = "vagrant"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 22, host: 2322, id: "ssh"
  config.ssh.insert_key = false

  config.vm.synced_folder ".", "/home/vagrant/python-offline-env", owner: "vagrant", group: "vagrant"

  config.vm.provider "virtualbox" do |vb|
    #vb.cpus = 2
    #vb.memory = "1536"
  end
end
