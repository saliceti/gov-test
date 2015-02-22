# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-nocm"

  # Install puppet on every host
  config.vm.provision "shell", inline: <<-SHELL
    # Test if puppet is installed
    if ! $(dpkg -s puppet > /dev/null 2>&1); then
      # Configure puppetlabs apt repository
      wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
      sudo dpkg -i puppetlabs-release-trusty.deb

      # Install puppet
      sudo apt-get update
      sudo apt-get install -y puppet=3.7.4-1puppetlabs1
    fi
  SHELL

  config.vm.define "nginx" do |nginx|

    nginx.vm.network "private_network", ip: "10.0.0.2"

    nginx.vm.provision "puppet" do |puppet|
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/vagrant-manifests"
      puppet.hiera_config_path = "puppet/hiera.yaml"
      puppet.manifest_file = "nginx.pp"
    end

    nginx.vm.provision "shell",
      inline: "/bin/nc -w 1 localhost 80 > /dev/null || echo Error: The application was not started successfully!"

  end

  (3..4).each do |i|
    config.vm.define "app-#{i}" do |app|

      app.vm.network "private_network", ip: "10.0.0.#{i}"

      app.vm.provision "puppet" do |puppet|
        puppet.module_path = "puppet/modules"
        puppet.manifests_path = "puppet/vagrant-manifests"
        puppet.hiera_config_path = "puppet/hiera.yaml"
        puppet.manifest_file = "app.pp"
      end

      app.vm.provision "shell",
        inline: "/bin/nc -w 1 localhost 8000 > /dev/null || echo Error: The application was not started successfully!"

    end
  end

end
