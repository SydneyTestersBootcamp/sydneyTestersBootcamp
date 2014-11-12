##Session 6: Security Testing

The aim of this session is to help tester to kick start the Security Testing journey.

####Agenda:
1. Quick brief on Security Testing
2. Tools for using
	- Web - browser (Chrome, Firefox, IE)
	- Burbsuite
	- OWASP ZAP
	- ...
3. Hands-on Test Lab

####Installation Instruction
######Prerequisite packages:

Ruby and related Gems
- For Unix:
```sh
curl -sSL https://get.rvm.io | bash -s stable --ruby
```
- For Windows: download and install <a href="http://rubyinstaller.org/downloads/" target="_blank">Ruby</a> then <a href="http://rubyinstaller.org/downloads" targe="_blank">Install DevKit</a> (package is to support Ruby to build native package during gem installation).<br>
You should choose a non-space in full path as the destination for the kit. i.e C:\DevKit, then add *C:\DevKit\bin;C:\DevKit\mingw\bin* to your System PATH (type below command on prompt)
```sh
SET PATH=C:\Devkit\bin;C:\Devkit\mingw\bin;%PATH%
```
- After Ruby is installed, run below commands to install gems
```sh
sudo gem install bundler
bundle install
```

JDK (version >= 1.7): you should grab it from <a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">Oracle Website</a>
######Checkout project from GitHub and setup the test lab
- We will use Railsgoat app as test lab for this session. This is a Ruby-Rails web app which was designed to demonstrate OWASP Top 10
```sh
git clone https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp.git
git clone https://github.com/OWASP/railsgoat.git
cd railsgoat
bundle install
```
- If you don't have git, you can find it <a href="http://git-scm.com/downloads" target="_blank">here</a>.
- If gem installation finishes successfully (you see no error), you can start the lab as below:
```sh
rake db:setup (to setup a clean DB with some seed data) 
rails server (start up server at port 3000)
```
- You now can access to the lab via http://localhost:3000/
- NOTE: you should now disconnect your computer from network since the Security Test Lab was purposely setup with security holes, hence would leave your PC openned for being attacked

######Important time saving note
Since downloading and compiling gems make take long time, please run above command prior coming to the session

######Additional tools
- Burp Suite (Free version): Web Pen Testing Toolsuite <a href="http://portswigger.net/burp/downloadfree.html" target="_blank">Download Here</a><br>
- DB tool: Universal DB Client tool. <a href="http://www.dbvis.com/download/" target="_blank">Download Here</a><br>
- Webgoat: Another Security Test Lab using Java stack. <a href="https://github.com/WebGoat/WebGoat/releases/download/v6.0.1/WebGoat-6.0.1-war-exec.jar" target="_blank">Download Here</a>
- Webgoat.net: Another Security Test Lab using .NET stack. https://github.com/jerryhoff/WebGoat.NET

####Common issues
Sometimes gems got failure during installation, in that case try to follow the last instruction from the log that outputed to screen). If even the instruction doesn't help, then post it up on the Sydney Tester Bootcamp wall.

####Reading Material
- <a href="https://www.owasp.org/index.php/Top_10_2013-Top_10" target="_blank">OWASP Top 10</a>: List of top 10 security issues. Please make sure you go through this before the session.
- Quick Youtube video on <a href="https://www.youtube.com/watch?v=JmAk1OVwp-4" target="_blank">how to setup and use Burp Suite</a>


