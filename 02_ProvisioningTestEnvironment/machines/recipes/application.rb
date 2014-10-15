# directory "/home/vagrant/sydney-tester" do
#   owner "vagrant"
#   group "vagrant"
#   action :create
# end

# execute "clone-website" do
#   cwd "/home/vagrant/sydney-tester"
#   user "vagrant"
#   command "git clone https://github.com/hdushan/quickquote.git"
# end

# ENV['RVM_HOME'] = "/usr/local/rvm"
# execute "install-gems" do
#   cwd "/vagrant_data/quickquote"
#   user "vagrant"
#   command <<-EOH
#   	/usr/local/rvm/bin/rvm use 2.1.2 --default
#   	bundle install
#   EOH
#   action :run
# end

# installing JDK 7
# execute "install-jdk7" do
#   command <<-EOH
#     apt-get install software-properties-common python-software-properties
#     add-apt-repository -y ppa:webupd8team/java
#     apt-get update
#     apt-get -y install oracle-java7-installer
#   EOH
#   action :run
# end

# create folder
# directory "/usr/local/java" do
#   owner "root"
#   group "root"
#   action :create
# end

# installing JDK 7 from local package
# execute "install-local-jdk" do
#   cwd "/usr/local/java"
#   command <<-EOH
#     apt-get purge openjdk-\*
#     cp /vagrant_data/jdk-7u67-linux-x64.gz /usr/local/java/
#     tar -xvzf jdk-7u67-linux-x64.gz

#     update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0_67/bin/java" 1
#     update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0_67/bin/javac" 1
#     update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.7.0_67/bin/javaws" 1

#     update-alternatives --set java /usr/local/java/jdk1.7.0_67/bin/java
#     update-alternatives --set javac /usr/local/java/jdk1.7.0_67/bin/javac
#     update-alternatives --set javaws /usr/local/java/jdk1.7.0_67/bin/javaws

#     echo "export JAVA_HOME=/usr/local/java/jdk1.7.0_67" >> /etc/profile
#     echo "export PATH=$PATH:$JAVA_HOME/bin" >> /etc/profile
#   EOH
#   action :run
# end
