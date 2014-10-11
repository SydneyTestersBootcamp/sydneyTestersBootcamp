#
# Cookbook Name:: sample
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# apt_package "git" do
#   action :install
# end

# apt_package "subversion" do
#   action :install
# end

# execute "install-rvm-and-ruby" do
#   command <<-EOH
#     curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.2
#     source /usr/local/rvm/scripts/rvm
#     rvm use 2.1.2 --default
#     gem install bundler
#   EOH
#   action :run
# end

# user 'sydneytester' do
#    home '/home/sydneytester'
#    shell '/bin/bash'
#    password '$1$hdt9AgF0$nJNdBgzkfHZKNlyhPa2Bd/'
# end


# directory '/vagrant_data/quickquote' do
#    owner 'sydneytester'
#    group 'sydneytester'
#    mode '0644'
#    action :create
# end
