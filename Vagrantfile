# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/centos8s"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  config.vm.network "forwarded_port", guest: 80, host: 8888, host_ip: "127.0.0.1"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize the amount of memory on the VM:
    vb.memory = "1024"

    config.vm.synced_folder "svpb", "/home/svpb/svpb", create: true
  end

  # Same settings for libvirt provider (used if virtualbox is not installed)
  config.vm.provider "libvirt" do |v|
    v.memory = 1024

    config.vm.synced_folder "svpb", "/home/svpb/svpb", create: true, nfs_version: 4.2, nfs_udp: false
  end

  # Make VM's name match ansible target host
  config.vm.define "svpb"

  # Provisioning: Prepare access to VM for ansible
  # Copy vagrant's key authorization to root
  # A bit hacky via shell, as file provisioner doesn't allow privileged access
  config.vm.provision "shell" do |s|
    s.inline = <<-SHELL
    mkdir -p /root/.ssh
    cp /home/vagrant/.ssh/authorized_keys /root/.ssh/authorized_keys
    SHELL
    s.privileged = true
  end

  # Do the actual provisioning with ansible
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v" # use vvv for very verbose output
    ansible.playbook = "playbook.yml"
    # Do not force usage of user vagrant, instead use remote_user specified in
    # playbook
    ansible.force_remote_user = false
  end

end
