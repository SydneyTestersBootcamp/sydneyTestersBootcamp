####Session 2: Provisioning Test Environment with Chef and Vagrant

The aim of this session is to help Tester to quickly set up Test / Dev environment on their own machine and share the configuration among team members.

Contents:
- Common Tasks on setting up new Dev/Test Environment (without Chef/Vagrant)
- Most common used Vagrant commands
- Installing pre-require packages
- Iteration 1: Installing base packages for the Guest VM
- Iteration 2: Installing DB and creating seed data
- Iteration 3: Loading latest code
- Iteration 4: Handling the configuration to other members

####Installation Instruction

1. Install Vagrant, Virtualbox
Get the software at below sites
Vagrant:
https://www.vagrantup.com/downloads.html

Virtualbox:
https://www.virtualbox.org/wiki/Downloads

2. Ruby and related Gems
For Unix:
\curl -sSL https://get.rvm.io | bash -s stable --ruby

For Windows:
http://rubyinstaller.org/downloads/

Installing require gems and vagrant plugins:
gem install berkshelf --no-ri --no-rdoc
sudo gem install bundler
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus

3. Checkout project from GitHub
git clone https://github.com/hdushan/quickquote.git

if you don't have git, please get it from: http://git-scm.com/downloads

4. Vagrant up
cd quickquote/machines
bundle install
vagrant up

5. Finalize
####Reading Material

1. Mischa Taylor's Coding Blog:

http://misheska.com/blog/2013/06/16/getting-started-writing-chef-cookbooks-the-berkshelf-way/
http://misheska.com/blog/2013/06/23/getting-started-writing-chef-cookbooks-the-berkshelf-way-part2/
http://misheska.com/blog/2013/08/06/getting-started-writing-chef-cookbooks-the-berkshelf-way-part3/

2. Chef Online Documents:

https://docs.getchef.com/essentials_cookbooks.html


####Pre-requisites

1. Virtualbox (https://www.virtualbox.org/wiki/Downloads)
2. Vagrant (https://www.vagrantup.com/downloads.html)
3. Ruby (>= 1.9) other ruby packages (Gem, Berkshelf...)
