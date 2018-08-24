## Vagrant

##### Exercise 1 - First Vagrant File
  * Create your first Vagrant VM using centos/7 box (quick google will find the URL).
  * Setup Vagrantfile, build vagrantfile and ssh to new VM.

##### Exercise 2 - Install Vagrant plugins
  * Configure these plugins in your Vagrantfile as you see fit.
  * Read what each does and the benefit of it
    * vagrant-cachier
    * vagrant-vbox-snapshot
    * vagrant-vbguest

##### Exercise 3 - Custom networking and hostname
  * Create a private network and give the VM a custom hostname:
    * IP: 10.120.0.2 
    * MASK: 255.255.255.0
    * Custom hostname: proxy.vagrant.local

##### Exercise 4 - Customize the VM configuration
  * Change the VM settings to have specific CPU and Memory settings:
    * Mem: 512
    * CPU: 2

##### Exercise 5 - Setup multiple VMs in a single VagrantFile
  * Add 2 new VMs to the file called: 
    * Hostname: wordpress.vagrant.local
    * Hostname: db.vagrant.local

  * Create an inline **shell** provisioner that will update the Operating System for all VMs
  * Create vagrant groups as follows:
    * frontend: proxy
    * backend: web and db
