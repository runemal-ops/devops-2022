#!/bin/bash
BLUE='\033[1;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN} #### Preparing The Environment... ####${NC}"
sudo apt install -y virt-manager qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base

echo -e "${GREEN} #### Installing latest Ansible version... ####${NC}"
pip3 install ansible

echo -e "${GREEN}#### Installing Vagrant ####${NC}"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y && sudo apt install -y vagrant

echo -e "${GREEN}#### Initializing Vagrantfile... ####${NC}"
rm -rf Vagrantfile && vagrant init --template Vagrantfile.erb
echo -e "#${GREEN}#### Setting up Vagrant required plugins... ####${NC}"
vagrant plugin list | grep -v libvirt || vagrant plugin install vagrant-libvirt 
vagrant plugin list | grep -v mutate || vagrant plugin install vagrant-mutate

echo -e "${GREEN} # You are all set, starting your machines with #~> vagrant up command # ${NC}"
vagrant up

echo -e "${BLUE}#### Initializing Hosts... ####${NC}"
./LabSetup/setup_hosts.sh

echo -e "${BLUE}#### Setting Up Ansible on Hosts ####${NC}"
./Ansible/setup_ansible.sh

echo -e "${BLUE}#### Deploying app on Hosts ####${NC}"
./Docker/deploy_app.sh

echo -e "${BLUE}#### Setting Up Swarm ####${NC}"
./DockerSwarm/setup_swarm.sh
