group "jenkins" do
  action :create
end

user "jenkins" do
  comment "Jenkins"
  uid 5000
  gid "jenkins"
  home "/var/lib/jenkins"
  shell "/bin/bash"
  password "jenkins"
end

#execute "CreateJenkinsJob" do
#  command "rpm -ivh /Installers/jenkins-1.582-1.1.noarch.rpm"
#  action :run
#end

#execute "CreateJenkinsJob" do
#  command "service jenkins start"
#  action :run
#end

#execute "Sleep" do
#  command "sleep 30"
#  action :run
#end

#execute "CurlToJenkins" do
#  command "curl http://localhost:8080 --verbose"
#  action :run
#end

#execute "CreateJenkinsJob" do
#  command "curl -X POST -d @/Installers/config.xml -H \"Content-Type: application/xml\" http://localhost:8080/createItem?name=QuickQuote -v"
#  action :run
#end

#execute "UpdatePluginList" do
#  command "curl -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack --verbose"
#end

#execute "InstallGitPluginForJenkins" do
#  command "java -jar /Installers/jenkins-cli.jar -s http://localhost:8080 install-plugin git -restart"
#  action :run
#end