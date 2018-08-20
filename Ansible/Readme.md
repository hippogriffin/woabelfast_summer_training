## Ansible

#### Exercise 1
* Create a new Ansible folder under your own folder and create an exercise folder here.
* Copy Vagrantfile from exercise 5 of the Vagrant training to this folder
* Create Ansible folder structure according to best practice
	* http://docs.ansible.com/ansible/devel/user_guide/playbooks_best_practices.html
* Create an Ansible inventory file for proxy, WordPress and db in whichever format you like for now (ini or yaml).
* Add front-end and back-end groups to Ansible inventory which contain the relevant hosts.
	* Add other groups you might think are relevant.
* Create blank group_var files for each of the groups you created.
* Create an Ansible role that installs the 'epel-release' package using the Ansible 'yum' module on all hosts 
	* http://docs.ansible.com/ansible/latest/modules/yum_module.html
* Populate "site.yml" to run the new role created

##### Vagrant with Ansible
* Expand your Vagrantfile to include an Ansible provisioner to run "site.yml" 
* Run *vagrant up* on all VMs to build and provision with Ansible
* Once the Ansible completes run *vagrant provision* to re-run the vagrant provisioner step and test that Ansible does not try to re-run those steps already completed (**[idempotent](https://en.wikipedia.org/wiki/Idempotence)**).
	
#### Exercise 2
* Copy the Vagrantfile from exercise 1
* Using Geerlingguy's Nginx module (from Ansible Galaxy):
  * https://galaxy.ansible.com/docs/mazer/examples.html#installing-roles
  * https://galaxy.ansible.com/geerlingguy/nginx/
  
  Create a test proxy config on the `proxy` VM and a default site on the `WordPress` VM (ensure hosts are listening on port 80)
  
* Using Geerlingguy's Firewall role (from Ansible Galaxy):
  * https://galaxy.ansible.com/geerlingguy/firewall/
  
  Open up port 80 on the `WordPress` VM to allow traffic from 'proxy' 
  
* Once Ansible config is complete, use vagrant to provision the Proxy and WordPress VMs
* Test port 80 connectivity to 'WordPress' from 'proxy' (curl for example)
* Add a local host entry to your Mac for example.com so you can view the site via a browser

#### Exercise 3

* Run an adhoc command against one or all of your VMs to find out which kernel version they are running:	
	* https://docs.ansible.com/ansible/2.5/user_guide/intro_adhoc.html
