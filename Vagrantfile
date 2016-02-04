# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "bgp-hackathon"

  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 9092, host: 9092
  #config.vm.network "forwarded_port", guest: 5432, host: 5432

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
  end

  config.vm.provider "libvirt" do |lv|
    lv.memory = 2048
  end

  config.vm.provision "update", type: "shell", inline: <<-SHELL
    apt-get -y update
    SHELL

  config.vm.provision "bgp-tools", type: "shell", path: "scripts/bgp-tools.sh"
  config.vm.provision "bgp-hijacks", type: "shell", path: "scripts/bgp-hijacks.sh"
  config.vm.provision "ripe-tools", type: "shell", path: "scripts/ripe-tools.sh"
  config.vm.provision "kafka", type: "shell", path: "scripts/kafka.sh"
  config.vm.provision "openbmp", type: "shell", path: "scripts/openbmp.sh"
  config.vm.provision "bgpmon", type: "shell", path: "scripts/bgpmon.sh"
  config.vm.provision "bgpstream", type: "shell", path: "scripts/bgpstream.sh"
end
