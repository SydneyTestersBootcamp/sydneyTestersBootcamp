##Session 2: Provisioning Test Environment with Chef and Vagrant

The aim of this session is to help Tester to quickly set up Test / Dev environment on their own machine and share the configuration among team members.

####Agenda:

- Common Tasks on setting up new Dev/Test Environment (without Chef/Vagrant)
- Iteration 0: Prepare tools and ingredients
- Iteration 1: First taste of Vagrant - Chef using default setting
- Iteration 2: Adding some sugar - using available recipes
- Iteration 3: Little bit of chilli - creating your first recipe
- Iteration 4: Last check before committing
- Iteration 5: Integrating the provision to project

####Installation Instruction
######Prerequisite packages:
- Install Vagrant<br>
Choose Vagrant for your prefer OS from: https://www.vagrantup.com/downloads.html
- Install Virtualbox<br>
https://www.virtualbox.org/wiki/Downloads
- Install ChefDK<br>
http://downloads.getchef.com/chef-dk/
- Install DevKit (Windows user only)<br>
This package is to support Ruby to build native package (for gem installation). You can find it at http://rubyinstaller.org/downloads<br>
You should choose a non-space in full path as the destination for the kit. i.e C:\Hashicorp\DevKit<br>
Then go to the DevKit folder to run devkitvars.bat

######Important time saving note
Since creating first virtual machine would trigger downloading of hundred of megabytes, please run below command prior coming to the session
```sh
cd sydneyTestersBootcamp/02_ProvisioningTestEnvironment/machines (if you're not in the machines folder)
vagrant box add chef/ubuntu-14.04
bundle install
```
and select option 1 (Virtual Box), this would trigger downloading the base virtual box for ubuntu 14.04 x64

######Ruby and related Gems
- For Unix:
```sh
curl -sSL https://get.rvm.io | bash -s stable --ruby
```
- For Windows: download and install Ruby from http://rubyinstaller.org/downloads/
- Installing require gems and vagrant plugins:
```sh
sudo gem install bundler
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-cachier
```

######Checkout project from GitHub
- If you don't have git, please get it from: http://git-scm.com/downloads
```sh
git clone https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp.git
```

- Bring up the machine
```sh
cd sydneyTestersBootcamp/02_ProvisioningTestEnvironment/machines
bundle install
vagrant up
```

- You're now ready to travel to your VM
```sh
vagrant ssh
```
For Windows, you will need an SSH client: http://the.earth.li/~sgtatham/putty/latest/x86/putty.zip<br>
Port: 22<br>
Host: 33.33.33.10 (the ip address in your Vagrantfile)<br>
Username: vagrant<br>
Password: vagrant<br>

####Most used commands
- vagrant up: bring up and provision the machine
- vagrant destroy: anything goes wrong, destroy the machine and rebuild it with vagrant up
- vagrant halt: shutdown the machine
- vagrant reload: restart the machine
- vargant provision: provision the machine with all chef's recipes
- vagrant box add box-name / box-url: download the base box (this step is included in vagrant up, but we can still pre-download it)
- vagrant suspend: hibernate the machine, you can later resume it with vagrant resume
- vagrant ssh: connect to the local virtual machine via ssh

####Common issues
- *RuntimeError: Couldn't determine Berks version*<br>
You would need to add chefdk/bin **at front of your PATH**<br>
For MacOSX: default chefdk is at /opt/chefdk/bin<br>
For Windows: default chefdk is at C:\opscode\chefdk\bin
- *The directory where plugins are installed (the Vagrant home directory) has a space in it...*<br>
For Windows user only, you can use `echo %username%` to get username and you can fix this by moving the .vagrant.d to a folder that has no space in the full path, and set the system variable VAGRANT_HOME=new_path_to_vagrant.d<br>
i.e: VAGRANT_HOME=C:\HashiCorp\.vagrant.d

####Reading Material
- Mischa Taylor's Coding Blog:<br>
http://misheska.com/blog/2013/06/16/getting-started-writing-chef-cookbooks-the-berkshelf-way/ <br>
http://misheska.com/blog/2013/06/23/getting-started-writing-chef-cookbooks-the-berkshelf-way-part2/ <br>
http://misheska.com/blog/2013/08/06/getting-started-writing-chef-cookbooks-the-berkshelf-way-part3/ <br>
<br>

- Chef Online Documents:<br>
https://docs.getchef.com/essentials_cookbooks.html

- Vagrant Online Documents:<br>
http://docs.vagrantup.com/v2/
