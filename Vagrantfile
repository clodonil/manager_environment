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
      # Start of Vault
      vault.vm.provision "shell", path: "vault/ServerVault.sh"
   end


  # Jenkins e bolt
  config.vm.define "jenkins" do |jenkins|
      jenkins.vm.hostname = "jenkins.vm"
      jenkins.vm.network :private_network, :ip => "192.168.77.200"
      # Install Bolt
      jenkins.vm.provision "shell", path: "jenkins/install.sh"
      jenkins.vm.provision "shell", path: "bolt/install.sh"
   end

  # Repo
  config.vm.define "repo" do |repo|
      repo.vm.hostname = "repo.vm"
      repo.vm.network :private_network, :ip => "192.168.77.210"
      # Install Artifactory
      repo.vm.provision "shell", path: "nexus3/install.sh"

      repo.vm.provider :libvirt do |setting|
           setting.memory = 1024
           setting.cpus = 1
      end      
   end



  config.vm.define "linux" do |linux|
      linux.vm.hostname = "linux.vm"
      linux.vm.network :private_network, :ip => "192.168.77.10"
      linux.vm.provision :hosts, :sync_hosts => true

      linux.vm.provision "shell", inline: <<-SHELL
           sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
           service sshd restart
      SHELL
   end

end
