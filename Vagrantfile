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
  config.vm.box = "almalinux/9"

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
    vb.memory = "2048"
    vb.cpus = "2"

    config.vm.synced_folder "svpb", "/home/svpb/svpb", create: true
    config.vm.synced_folder "ansible", "/home/vagrant/ansible", create: true
  end

  # Same settings for libvirt provider (used if virtualbox is not installed)
  config.vm.provider "libvirt" do |v|
    v.memory = 2048
    v.cpus = 2

    config.vm.synced_folder "svpb", "/home/svpb/svpb", create: true, nfs_version: 4.2, nfs_udp: false
    config.vm.synced_folder "ansible", "/home/vagrant/ansible", create: true, nfs_version: 4.2, nfs_udp: false
  end

  # Make VM's name match ansible target host
  config.vm.define "svpb"

  # Provisioning: Run Ansible locally inside the Vagrant VM
  # Compared to the ansible "remote" provisioner accessing the VM via ssh,
  # using "local" makes installing ansible on the host superfluous. Thus it is
  # also usable from Windows which is not supported by ansible.
  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "/home/vagrant/ansible"
    ansible.playbook = "playbook.yml"
  end

  # Workaround to ensure services are running
  # They fail to start due to mounts not being present on system startup.
  # Trying to define dependencies directly in the systemd service file did not
  # work. However, this hack has the advantage of only being run when vagrant
  # is used, thus there's no need to alter files which look different in production.
  # https://serverfault.com/questions/808239/systemd-vagrant-and-virtualbox-wait-for-synced-folder-to-mount
  config.vm.provision "shell", run: "always", inline: "sudo systemctl restart nginx svpb"

end
