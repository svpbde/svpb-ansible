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
* [ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* [vagrant](https://developer.hashicorp.com/vagrant/downloads)

On a debian-based system, they can be installed with
```
sudo apt install ansible vagrant
```
Vagrant relies on a virtualisation software being installed, e.g. [virtualbox](https://www.virtualbox.org/).
If possible, use virtualbox.
If not possible (e.g. due to problems with the installation of virtualbox on debian bookworm), you can use [libvirt](https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html#ubuntu--debian) in connection with [qemu](https://packages.debian.org/bookworm/qemu-system-x86).
```
sudo apt install vagrant-libvirt libvirt-daemon-system qemu-system-x86
sudo usermod -a -G libvirt <YOUR USERNAME>
```

The ansible playbook uses the role "anxs.postgresql" which has to be installed on the host via
```
ansible-galaxy install anxs.postgresql
```

Usage
-----
```
cd svpb-ansible
vagrant up
```
This automatically runs every step required to get a working VM.
You can connect to it with ```vagrant ssh```.
To manually run an ansible playbook, e.g. `provision.yml` to pull the latest version from github, use (as mentioned in [ansible's doc](https://docs.ansible.com/ansible/latest/scenario_guides/guide_vagrant.html#running-ansible-manually))
```
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory provision.yml
```
