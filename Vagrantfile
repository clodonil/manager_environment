# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  #  Configure base
  config.vm.box = 'centos/7'
  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  # Vault
  config.vm.define "vault" do |vault|
      vault.vm.hostname = "vault.vm"
      vault.vm.network :private_network, :ip => "192.168.77.100"
      vault.vm.provision :hosts, :sync_hosts => true
      # Start of Vault
      vault.vm.provision "shell", path: "vault/ServerVault.sh"
   end


  # bolt
  config.vm.define "bolt" do |bolt|
      bolt.vm.hostname = "bolt.vm"
      bolt.vm.network :private_network, :ip => "192.168.77.200"
      bolt.vm.provision :hosts, :sync_hosts => true
      # Install Bolt
      bolt.vm.provision "shell", path: "bolt/install.sh"
   end
end