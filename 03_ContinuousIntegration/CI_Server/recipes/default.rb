magic_shell_environment 'PATH' do
  value '$PATH:/usr/local/rvm/gems/ruby-2.1.2/bin:/usr/local/rvm/gems/ruby-2.1.2@global/bin:/usr/local/rvm/rubies/ruby-2.1.2/bin:/usr/local/rvm/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/sbin:/usr/sbin:/sbin:/home/vagrant/bin:/home/vagrant/bin'
end

package "jenkins" do
  source "/Installers/jenkins-1.582-1.1.noarch.rpm"
end

service "jenkins" do
  action [:start, :enable]
end