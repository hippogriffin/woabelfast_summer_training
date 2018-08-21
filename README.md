## WebOps Summer 2018 Training
Training Repo that contains training exercises.


### Local Dev Setup

Setting up the local environment for development is important as you must ensure you have the same software versions as the team.

This usually isn't an issue when the project is just starting but can become an issue when joining new projects that have been in development for months.

To setup the local environment for this project do the following (MacOS):

    Install brew package manager:
     - https://brew.sh/
     
You can use brew to install a lot of different packages for MacOS such as Chrome/Firefox

    Install Iterm2 as a new terminal
     - https://sourabhbajaj.com/mac-setup/iTerm/

    Install VirtualEnv and VirtualEnv Wrapper for python packages:
     - https://www.dabapps.com/blog/introduction-to-pip-and-virtualenv-python/
     - https://sourabhbajaj.com/mac-setup/Python/virtualenv.html
     - https://virtualenvwrapper.readthedocs.io/en/latest/install.html

VirtualEnv is used to created virtual environments for installing and testing python packages with PIP, this ensures the system Python version does not get both in the way or broken.

    Install the following packages, choose which type of install you should use (brew, pip, internet)
     - Vagrant
     - Virtualbox
     - Ansible
     - Terraform
     - Visual Studio Code
     - Azure CLI
    
    
### Git

#### Exercise 1 - Using Linux
If you are confident in your Linux skills then you can skip this and to exercise 2. 
The following site has some very useful information about navigating and use the commandline in Linux:
- https://ryanstutorials.net/linuxtutorial/

#### Exercise 2 - Using Git

Cheat Sheet - https://www.git-tower.com/blog/git-cheat-sheet

Clone this repo locally into a folder, be mindful of locations on your mac as starting messy gets worse, be organised i.e. projects folder, sub-folders per project etc.

##### Individually do the following tasks: 
* Create a branch away from master with a relevant name in the syntax of "feature/<feature-name>"
* Create a file with some text
* Create a folder with nothing inside
* Commit and push your branch to GitHub
* Go to GitHub and look at the repo, your files wont be there as its no in master, select branch dropdown box and select your branch name and you should see your file
  * Also notice your folder doesn’t appear, Git does not upload empty folders
* Create a pull request to merge you branch into Master, assign to another team member for review
* Once merged checkout master and git pull to grab all changes to master (very important on projects as multiple people are working on the repo and changes could affect your next backlog item)
* Create new branch and make changes to existing files, commit and push back
* Create pull request and view the changes to the existing file, should show whats changing  which is where review comments will be made

Some files don’t need to be there, if we have local files which we want git to ignore we use a .gitignore file. 

This file details all filenames/regex for files we want git to ignore, this could be something simple like a .DS_Store file which Macs create in every folder or something more important like local AWS credentials that are in the same directory (not something we do).

Note the use of a DOT at the start of a file, in Linux/Unix world this is a hidden file which wont show up in terminal with a basic `ls -l`

##### As a team do the following tasks:
* Create a .gitignore file
    * Google and dicuss for common files types/names that you would normally add to this file.
    * Push and merge this to the master branch

##### Git best practices:
   * Branch Naming 
      * Make it relevant to the change/ticket you are working on `feature/<name>`
   * Always push to your branch regularly so you never lose work
   * When ready to merge to master, may be necessary at times to checkout master, pull and then merge this into your branch as changes have occurred since you create your own branch.
