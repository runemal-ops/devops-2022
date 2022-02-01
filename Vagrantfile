# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  servers = [
    {
      :hostname => "odin0", 
      :box => "generic/debian10", 
      :ip => "192.168.122.2", 
      :ssh_port => '2200'
    },
    {
      :hostname => "rune1", 
      :box => "generic/debian10", 
      :ip => "192.168.122.3", 
      :ssh_port => '2201'
    },
    {
      :hostname => "rune2", 
      :box => "generic/debian10", 
      :ip => "192.168.122.4", 
      :ssh_port => '2202'
    }
  ]

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = machine[:box]
      node.vm.hostame = machine[:hostname]
      node.vm.network :private_network, ip: machine[:ip]
      node.vm.network "forwarder_port", guest: 22, host: machine[:ssh_port],id: "ssh"
      node.vm.provider :libvirt do |libvirt|
        libvirt.customize ["modifyvm", :id, "--memory", 2048]
        libvirt.customize ["modifyvm", :id, "--cpus", 2]
      end
    end
  end
end
