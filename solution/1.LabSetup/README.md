# Option 1 - Prepare the environment with the Setup bash script

# Option 2 - Setup the environment Manually

## Install Vagrant
https://www.vagrantup.com/docs/installation

## Install Vagrant Plugins
vagrant plugin list | grep -v libvirt || vagrant plugin install vagrant-libvirt 
vagrant plugin list | grep -v mutate || vagrant plugin install vagrant-mutate

## Install libvirt, qemu and kvm
sudo apt install -y virt-manager qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base

## Lab
```bash
vagrant up
vagrant ssh odin0
```

### Copy over host file
```bash
sudo cp /vagrant/hosts /etc/hosts
```
