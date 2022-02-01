#!/bin/bash
echo "#### Preparing The Environment... ####"
sudo apt install -y qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base

echo "#### Installing latest Ansible version... ####"
pip3 install ansible

echo "#### Installing Vagrant #### "
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y && sudo apt install -y vagrant

echo "#### Initializing Vagrantfile... ####"
vagrant init --template Vagrantfile.erb
vagrant plugin list | grep -E libvirt && vagrant plugin install vagrant-libvirt 
vagrant plugin list | grep -E mutate && vagrant-mutate

echo "#### You are all set, start defining your machines in Vagrantfile ####"
