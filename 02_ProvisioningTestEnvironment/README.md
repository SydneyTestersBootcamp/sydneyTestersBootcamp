##Session 2: Provisioning Test Environment with Chef and Vagrant

The aim of this session is to help Tester to quickly set up Test / Dev environment on their own machine and share the configuration among team members.

####Contents:

- Common Tasks on setting up new Dev/Test Environment (without Chef/Vagrant)
- Most common used Vagrant commands
- Installing pre-require packages
- Iteration 1: Installing base packages for the Guest VM
- Iteration 2: Installing DB and creating seed data
- Iteration 3: Loading latest code
- Iteration 4: Handling the configuration to other members

####Installation Instruction
######Prerequisite packages:
- Install Vagrant<br>
Choose Vagrant for your prefer OS from: https://www.vagrantup.com/downloads.html
- Install Virtualbox<br>
https://www.virtualbox.org/wiki/Downloads
- Install ChefDK<br>
http://downloads.getchef.com/chef-dk/

######Important time saving note
Since creating first virtual machine would trigger downloading of hundred of megabytes, please run below command prior coming to the session
```sh
vagrant box add chef/ubuntu-14.04
```
this would trigger downloading the base virtual box for ubuntu 14.04 x64

######Ruby and related Gems
- For Unix:
```sh
curl -sSL https://get.rvm.io | bash -s stable --ruby
```
- For Windows: download and install Ruby from http://rubyinstaller.org/downloads/
- Installing require gems and vagrant plugins:
```sh
gem install berkshelf --no-ri --no-rdoc
sudo gem install bundler
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
```

######Checkout project from GitHub
- If you don't have git, please get it from: http://git-scm.com/downloads
```sh
git clone https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp.git
```

- Vagrant up
```sh
cd sydneyTestersBootcamp/02_ProvisioningTestEnvironment
bundle install
vagrant up
```

- You're now ready to travel to your VM
```sh
vagrant ssh
```

####Common issues
- RuntimeError: Couldn't determine Berks version<br>
You would need to add chefdk/bin in front of your PATH


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
