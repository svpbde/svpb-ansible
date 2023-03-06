svpb-ansible
============

This repo tracks the process of trying to setup a developer VM for the svpb
django webapp with the pre-existing ansible and vagrant files.
If the migration to docker succeeds, this repo becomes obsolete.

This repo should stay private due to the credentials included.
Nevertheless, the credentials were already published on the old master branch.
Credential management still has to be improved.

Dependencies
------------
* [vagrant](https://developer.hashicorp.com/vagrant/downloads)
  * On a debian-based system: `sudo apt install vagrant`
* Vagrant relies on a virtualisation software being installed.
  [virtualbox](https://www.virtualbox.org/) is recommended.
  See below for an alternative.

If you want to move files between guest and host, install the plugin vagrant-scp
```
vagrant plugin install vagrant-scp
```

Usage
-----
```
cd svpb-ansible
vagrant up
```
This automatically runs every step required to get a working VM.
You can connect to it with ```vagrant ssh```.
The synced folder `svpb` created in this directory mirrors the content of `/home/svpb/svpb`, i.e. you can edit the files in this directroy directly from your host system.
You can also use `vagrant-scp` to copy files between host and guest.

Using qemu instead of virtualbox
--------------------------------
If it is not possible to use virtualbox (e.g. due to problems with the installation of virtualbox on debian bookworm), you can use [libvirt](https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html#ubuntu--debian) in connection with [qemu](https://packages.debian.org/bookworm/qemu-system-x86).
```
sudo apt install vagrant-libvirt libvirt-daemon-system qemu-system-x86
sudo usermod -a -G libvirt <YOUR USERNAME>
```
