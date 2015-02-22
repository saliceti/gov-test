# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Install puppet on every host
  config.vm.provision "shell", inline: <<-SHELL
    # Test if puppet is installed
    if ! $(dpkg -s puppet > /dev/null); then
      # Configure puppetlabs apt repository
      wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
      sudo dpkg -i puppetlabs-release-trusty.deb

      # Install puppet
      sudo apt-get update
      sudo apt-get install -y puppet=3.7.4-1puppetlabs1
    fi
  SHELL

  config.vm.define "nginx" do |nginx|

    nginx.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.hiera_config_path = "puppet/hiera.yaml"
      puppet.manifest_file = "nginx.pp"
    end

    nginx.vm.provision "shell",
      inline: "/bin/nc -w 1 localhost 80 > /dev/null || echo Erro: Nginx was not started successfully!"

  end
end
