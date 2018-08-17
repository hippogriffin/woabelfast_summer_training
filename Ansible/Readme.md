## Ansible

#### Exercise 1
* Create a new Ansible folder under your own folder and create an exercise folder here.
* Copy Vagrantfile from exercise 2 of the Vagrant training to this folder
* Create Ansible folder structure according to best practice
	* http://docs.ansible.com/ansible/devel/user_guide/playbooks_best_practices.html
* Create an ansible inventory for proxy, web and db in whichever format you like for now
* Add front-end and back-end groups to Ansible inventory which contain the relevant hosts.
* Create blank group_var and host_var files for each of the groups/hosts
* Create Ansible role to install 'epel-release' package using Ansible 'yum' module on all hosts 
	* http://docs.ansible.com/ansible/latest/modules/yum_module.html
* Populate "site.yml" to run the new role created

##### Vagrant with Ansible
* Expand your Vagrantfile to include an Ansible provisioner to run "site.yml" 
* Run *vagrant up* on all VMs to build and provision with Ansible
* Once the Ansible completes run *vagrant provision* to re-run the vagrant provisioner step and test that Ansible does not try to re-run those steps already completed (idempotency).
	
#### Exercise 2
* Copy the Vagrantfile from exercise 1
* Use Geerlingguy's Nginx module (from Ansible Galaxy) and create test site config on the proxy and web VMs (ensure host is listening on port 80) 
  * https://galaxy.ansible.com/docs/mazer/examples.html#installing-roles
  * https://galaxy.ansible.com/geerlingguy/nginx/
* Use Geerlingguy's Firewall role from Ansible galaxy to open up port 80 on the 'web' VM to allow traffic from 'proxy' 
  * https://galaxy.ansible.com/geerlingguy/firewall/
* Deploy nginx base index.html from the nginx role above.
* Create 'proxy' and 'web' VMs and test port 80 connectivity to 'web' from 'proxy' (curl for example)

#### Exercise 3

* Run an adhoc command against one or all of your VMs to find out which kernel version they are running:	
	* https://docs.ansible.com/ansible/2.5/user_guide/intro_adhoc.html
