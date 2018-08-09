
## Terraform 

**Always run Terraform Destroy before the end of the day**

Create your own branch again with a relevant name, create a folder with your name.  
Use this for the following exercises and create a folder for each exercise:

##### Exercise	1. Create a terraform file with hardcoded elements
  * AWS Provider
  * VPC
  * Subnets
  * Security Group
  * Instance
    
##### Exercise	2. Add Variables to the file
 
* Convert the file from exercise 1 to use variables on common items (region, AMI, Instance size).

*Note how you cannot create/interact with other peoples Terraform code, if you run their code without the statefile it will create a brand new environment identical to theirs.*
	
##### Exercise	3. Use remote state files

  * Create a new folder and setup a Terraform remote state backend
  * Re-create the VPC, Subnets and Security Group again, this time using modules.
    * available online: https://registry.terraform.io/browse

##### Exercise	4. Testing remote state

Commit and push your code to your own branch, follow the commit/push/merge process to merge your code into the master branch.
  * Now that there are multiple folders and projects online with remote states, you should be able to go into any folder and initiate the terraform project locally (this means to setup your local environment with the remote state location using *terraform init*)
  * You should be able to make a change to this code, run a plan and then apply it.
  * The existing project should be updated rather than a new one being built.