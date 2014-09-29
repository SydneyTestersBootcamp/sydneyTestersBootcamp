package "jenkins" do
  source "/Installers/jenkins-1.582-1.1.noarch.rpm"
end

service "jenkins" do
  action [:start, :enable]
end