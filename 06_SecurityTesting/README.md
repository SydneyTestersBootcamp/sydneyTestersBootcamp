##Session 6: Security Testing

The aim of this session is to help tester to kick start the Security Testing journey.

####Agenda:
1. Security Testing in daily work
	- Dedicated security tester
	- Per task assigned
	- QA on Security Test result
	- ...
	
2. Type of Security Testing
	- Whitebox
	- Blackbox
	- Graybox (we focus on this for the session)
	
3. Tools for using
	- Web - browser (Chrome, Firefox, IE)
	- Burbsuite
	- OWASP ZAP
	- ...
	
4. Hands-on Test Lab

####Installation Instruction
######Prerequisite packages:
Ruby and related Gems
- For Unix:
```sh
curl -sSL https://get.rvm.io | bash -s stable --ruby
```
- For Windows: download and install <a href="http://rubyinstaller.org/downloads/" target="_blank">Ruby</a> then <a href="http://rubyinstaller.org/downloads" targe="_blank">Install DevKit</a> (package is to support Ruby to build native package during gem installation).<br>
You should choose a non-space in full path as the destination for the kit. i.e C:\DevKit<br>
Then go to the DevKit folder to run devkitvars.bat

- After Ruby is installed, run below commands to install gems
```sh
sudo gem install bundler
bundle install
```

######Checkout project from GitHub and setup the test lab
- We will use Railsgoat app as test lab for this session. This is a Ruby-Rails web app which was designed to demonstrate OWASP Top 10
```sh
https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp.git
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
Burp Suite (Free version): http://portswigger.net/burp/downloadfree.html<br>
DB tool: http://www.dbvis.com/download/

####Common issues
Sometimes gems got failure during installation, in that case try to follow the last instruction from the log that outputed to screen). If even the instruction doesn't help, then post it up on the Sydney Tester Bootcamp wall.

####Reading Material
- <a href="https://www.owasp.org/index.php/Top_10_2013-Top_10" target="_blank">OWASP Top 10</a>: List of top 10 security issues. Please make sure you go through this before the session.
- Quick Youtube video on <a href="https://www.youtube.com/watch?v=JmAk1OVwp-4" target="_blank">how to setup and use Burp Suite</a>
