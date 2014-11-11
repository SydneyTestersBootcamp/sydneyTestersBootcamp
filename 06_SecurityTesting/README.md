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
```sh
sudo gem install bundler
bundle install
```

######Checkout project from GitHub and setup the test lab
- If you don't have git, you can find it <a href="http://git-scm.com/downloads" target="_blank">here</a>.
```sh
git clone https://github.com/OWASP/railsgoat.git
cd railsgoat
bundle install
```

######Important time saving note
Since downloading and compiling gems make take long time, please run above command prior coming to the session

######Additional tools
Burp Suite (Free version): http://portswigger.net/burp/downloadfree.html<br>
DB tool: http://www.dbvis.com/download/

####Common issues
Sometimes gems got failure during installation, in that case try to follow the last instruction from the log that outputed to screen). If even the instruction doesn't help, then google for it. We will try to help when you are at the session, but that would cause bit rush.

####Reading Material
<a href="https://www.owasp.org/index.php/Top_10_2013-Top_10" target="_blank">OWASP Top 10</a>

