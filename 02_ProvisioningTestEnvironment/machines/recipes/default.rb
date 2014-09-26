#
# Cookbook Name:: sample
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'sample'

user 'sample' do
  group 'sample'
  system true
  shell '/bin/bash'
end

apt_package "git" do
  action :install
end

apt_package "curl" do
  action :install
end

apt_package "subversion" do
  action :install
end

execute "install-rvm-and-ruby" do
  command <<-EOH
    curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2
    source /usr/local/rvm/scripts/rvm
    rvm use 2.1.2 --default
    gem install bundler
  EOH
  action :run
end
