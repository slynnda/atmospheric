# -*- mode: ruby -*-

PASSWORD = "foo"


Vagrant.configure("2") do |config|

  config.package.name = "atmospheric"
  config.vm.box = "atmospheric"
  config.vm.hostname = "atmos"

  $install_packages = "/bin/bash --login /vagrant/provisioners/install-packages.sh"
  $configure_shell = "/bin/bash --login /vagrant/provisioners/configure-shell.sh"

  config.vm.provision :shell, privileged: false, inline: $install_packages
  config.vm.provision :shell, privileged: true, inline: $configure_shell

  config.vm.provider :virtualbox do |vb|
    
    vb.name = "atmospheric"
    vb.gui = false
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--usb", "on"]
    vb.customize ["usbfilter", 'add', '0', '--target', :id, '--name', 'Yubikey', '--vendorid', '0x1050', '--productid', '0x0407']
  end

end
