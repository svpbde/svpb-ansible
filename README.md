svpb-ansible
============

This repo contains the files necessary to setup a developer VM for the svpb
django webapp.
It strives to mirror the production server as close as possible.
Thus, the ansible playbook also serves as a guideline how to setup the
production server.

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
* If you want to move files between guest and host, install the plugin 
  vagrant-scp with `vagrant plugin install vagrant-scp`

Usage
-----
```
git clone https://github.com/svpbde/svpb-ansible
cd svpb-ansible
vagrant up
```
This automatically runs every step required to get a working VM.

Now you can
* access the webapp via [http://127.0.0.1:8888](http://127.0.0.1:8888)
* edit the content of the directory `svpb` from your host system, it's a
  synced directory and mirrors the content of `/home/svpb/svpb`.
* connect to the VM with `vagrant ssh`
* shutdown the VM with `vagrant halt`
* start over with `vagrant destroy` & another run of `vagrant up` (delete
  the `svpb` directory if you do not want to keep your changes)
* use `vagrant-scp` to copy files between host and guest

Feel free to poke around and destroy everything, starting over just takes a 
couple of minutes.

Using qemu instead of virtualbox
--------------------------------
If it is not possible to use virtualbox (e.g. due to problems with the
installation of virtualbox on debian bookworm), you can use
[libvirt](https://vagrant-libvirt.github.io/vagrant-libvirt/installation.html#ubuntu--debian)
in connection with
[qemu](https://packages.debian.org/bookworm/qemu-system-x86).
```
sudo apt install vagrant-libvirt libvirt-daemon-system qemu-system-x86
sudo usermod -a -G libvirt <YOUR USERNAME>
```

CentOS peculiarities
--------------------
CentOS has some peculiarities compared to e.g. Debian.
Some are listed below for anyone interested in diving into CentOS.
* Old default python version (currently 3.6, EOL Dec 2021)
  * Note that security updates are still provided by RedHat (longer than by
    official Python devs)
* [SELinux](https://www.redhat.com/en/topics/linux/what-is-selinux)
* Concept of *modules* (different versions of the same package installable
  via package manager)
* Not-so-nice texlive packages (incomplete and fine-grained, i.e. on package
  level instead of collections like texlive-science found on other systems)
