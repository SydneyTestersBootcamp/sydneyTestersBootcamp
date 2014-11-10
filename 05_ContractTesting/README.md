####Session 3: Continuous Integration with Jenkins

The aim of this session is to set up a Jenkins Continuous Integration Server & Agent that monitors a code repository and automatically runs tests everytime a developer checks in code.

This workshop follows on from last week's session about provisioning environments (using chef & vagrant to manage virtualbox VMs). We'll use some of what you learned there to build the CI server and agent VMs.

Contents:
- What is Continuous Integration (CI) and why is it needed?
- Setting up a CI server (Jenkins)
- Installing plugins
- Configuring the CI Server to monitor a code repo and run tests automatically on every checkin.
- Demo using a build pipeline to deploy to a Test Environment (to Heroku?).


####Reading Material

######Martin Fowler's article on <a href="http://www.martinfowler.com/articles/continuousIntegration.html" target="_blank">Continous Integration</a>

######Wikipedia: <a href="http://en.wikipedia.org/wiki/Continuous_integration" target="_blank">Continous Integration</a>

######Documentation on <a href="https://wiki.jenkins-ci.org/display/JENKINS/Step+by+step+guide+to+set+up+master+and+slave+machines" target="_blank">setting up Slaves and Masters</a>


####Pre-requisites

#####1. Install the below software.

Note: 
- If you attended the last session (Provisioning Test Envs using vagrant/chef), you probably have all items in the below table already installed. If thats the case, you <b>do not need to reinstall</b> them. However, please confirm that they are set up correctly by the method provided in the 3rd column. Also please ensure you do steps 5, 6 & 7.

If you have difficulties installing them on your machine, please Google the errors that you see. There's a good chance someone has seen the same before and has a solution. If that did not help resolve it, please post a question on the meetup events page. <b>Please try to get these resolved and have everything already setup before the session.</b>

| Tool/Software | Notes | How to test if this is installed fine |
| ------------- | ----- | ------------------------------------- |
| OSX/Linux: <br><a href="https://www.ruby-lang.org/en/" target="_blank">Ruby</a><br><br>Windows: <br><a href="http://rubyinstaller.org/downloads/" target="_blank">Ruby</a> | Install Version 2.1.2 or 2.1.3. | Run `ruby --version` at Command Prompt/Terminal. <br><br>Expected outcome: Should report a version `2.1.2` or greater. |
| <a href="https://www.virtualbox.org/" target="_blank">Virtualbox</a> | This tool runs the Virtual Machines (VMs) that we'll use for the workshop | You should be able to see the application `VirtualBox` in your 'All Programs' (Windows) or 'Applications' (OSX). Try starting it up. <br><br>Expected outcome: The VirtualBox application should start up fine.|
| <a href="https://www.vagrantup.com/" target="_blank">Vagrant</a> | This tool manages the VMs - downloads and install them, install dependancies, start them up, shut them down etc. You'll need version 1.6.3 or later. <br><b>NOTE: Windows users, please install vagrant into a folder that does not have spaces in the name, eg 'C:\vagrant'. After installing, edit `C:\vagrant\embedded\config­.yml` and change `C:\vagrant-temp\staging\embedded` to `C:\vagrant\embedded` </b> | Run `vagrant --version` at Command Prompt/Terminal. <br><br>Expected outcome: Should report a version `1.6.3` or greater. |
| <a href="https://downloads.getchef.com/chef-dk" target="_blank">chefdk</a> | This installs 'berkshelf', a tool that fetches required chef cookbooks for packages that need to be installed <br> Once installed, run the command `which berks` (on osx or linux). The output should look like `/usr/bin/berk` which should be a link to `/opt/chefdk/bin` (You can check that by running `ls -l /usr/bin/berk`). If this is set incorrect, please tweak your PATH so that your system picks up `berk` from the right location.| Run `berks --version` at Command Prompt/Terminal. <br><br>Expected outcome: Should report a version `3.1.5` or greater. |
| For Windows user only!<br<br>OSX & Linux users can skip this step<br><br><a href="http://rubyinstaller.org/downloads" target="_blank">DevKit</a> | This package is to support Ruby to build native package (for gem installation).<br><br>You should choose a folder with no spaces as the destination for the kit. i.e C:\Hashicorp\DevKit <br><br>Once installed, go to the DevKit folder in your command prompt, and run `devkitvars.bat`. | Not sure how to test this. |
| <a href="http://berkshelf.com/" target="_blank">vagrant berkshelf plugin</a> | Install it from the commandline by running `vagrant plugin install vagrant-berkshelf` | ~~Pray!~~ <br><br>Run `vagrant plugin list` at Command Prompt/Terminal. <br><br>Expected outcome: The list should include `vagrant-berkshelf`. |
| <a href="https://github.com/opscode/vagrant-omnibus" target="_blank">vagrant omnibus plugin</a> | A Vagrant plugin that ensures the desired version of Chef is installed via the platform-specific Omnibus packages. <br>Install it from the commandline by running `vagrant plugin install vagrant-berkshelf` | Run `vagrant plugin list` at Command Prompt/Terminal. <br><br>Expected outcome: The list should include `vagrant-omnibus`. |
| <a href="http://git-scm.com/" target="_blank">Git</a> | This is the source control tool that we'll use for the workshop. Windows users, while installing Git, please choose the option "Use Git from the Windows Command Prompt". | Run `git --version` at Command Prompt/Terminal. <br><br>Expected outcome: Should report a version `1.9.3` or greater. |


#####2. Create an account on <a href="https://github.com/" target="_blank">Github</a> (Skip this step if you have already done this for previous sessions).

#####3. Fork the repository into your own github account (Skip this step if you have already done this for previous sessions).

On your Browser, navigate to:
<a href="https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp" target="_blank">https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp</a>

On the top right corner of the page, there is a button called "Fork". Click that. This will fork this repo into your own account. <br>So you'd now have something like:<br> [https://github.com/your github username/sydneyTestersBootcamp](#)

#####4. Clone the forked repository into your local machine (Skip this step if you have already done this for previous sessions).

On your machine, open the command prompt or Terminal, and clone the repo by running:<br>
`git clone https://github.com/<your github username>/sydneyTestersBootcamp --depth 1`

This should create a folder 'sydneyTestersBootcamp' in your machine. This folder has all the files needed for the bootcamp.

This cloning could take a while. Once done, go into the session folder in your Command Prompt/Terminal<br> `cd sydneyTestersBootcamp/03_ContinuousIntegration`.

#####5. Update the forked repository into your local machine (This step is only for those of you who already have forked/cloned in previous sessions. If you just did step 5, then you do not need to do this).

On your machine, open the command prompt or Terminal, go to the folder where you had cloned the repo into (eg: `cd sydneyTestersBootcamp`).<br>

Add a remote alias 'upstream' pointing to the original repo that you forked from:<br>
`git remote add upstream https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp.git`

Now pull in the latest changes from the original repo:<br>
`git pull -s recursive -X theirs upstream master`

If you see an error message that looks like "Please, commit your changes or stash them before you can merge. Aborting", then run:
`git stash` and try the git pull again.

#####6. Set up the CI Server VM that we'll use for the workshop

Go into the folder that has the chef/vagrant configuration for the VM where we will install the CI Server (Master):

`cd CI_Server`

And run:

`vagrant up`

The first time you run this command, it downloads a Vritualbox VM ~500 MB in size (Centos Linux box, NOT the same as what we used in the Provisioning Test Envs session), installs a few packages onto it, and starts it up. This may take a long time (upto 60 mins, depending on your internet connection speed), so <b>please do this before coming for the session</b>. You may want to do this on a wifi connection due to the large data download.

You will see a flurry of debug messages on your terminal. Ignore any warnings that look like this: "warning: class variable access from toplevel". At the end, you'll see a message "INFO: Chef Run complete in xxx seconds".

Once the above is done, run `vagrant ssh` to ssh into the VM. Run the command `java -version` and ensure it reports 1.6.xxx.

Now run the command `exit` to exit out of the ssh session. Once back in your local machine command prompt, run `vagrant suspend` to suspend the VM.

#####7. Set up the CI Agent VM that we'll use for the workshop

Go into the folder that has the chef/vagrant configuration for the VM where we will install the CI Agent (Slave):

`cd ../CI_Agent`

and then:

`vagrant up`

This may take a long time, so <b>please do this before coming for the session</b>. You may want to do this on a wifi connection due to the large data download.

Once the above is done, run `vagrant ssh` to ssh into the VM. Run the command `java -version` and ensure it reports 1.6.xxx.

Now run the command `exit` to exit out of the ssh session. Once back in your local machine command prompt, run `vagrant suspend` to suspend the VM.

#####8. Set up an account for yourself at Heroku.com

As part of this workshop, we'll demo how to deploy an application to Heroku (Heroku is a free app-hosting platform).

Please create yourself a free account on <a href="https://www.heroku.com/" target="_blank">Heroku</a> and activate it.


####Common issues

- RuntimeError: Couldn't determine Berks version<br>
You would need to add /opt/chefdk/bin at the front of your PATH


####Some Data that we will use during the session (Ignore this for now, this is just used during the session):

######Git Plugin (Source Code Management):
https://github.com/SydneyTestersBootcamp/QuickQuoteCi.git

######Build steps for tests:
export PATH=/usr/local/rvm/gems/ruby-2.1.2/bin:/usr/local/rvm/gems/ruby-2.1.2@global/bin:/usr/local/rvm/rubies/ruby-2.1.2/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/rvm/bin:/home/vagrant/bin;

bundle install --path ./;

bundle exec rake;

######Cucumber Test Result Plugin:

reports/cucumber.json

######RubyMetrics Plugin:

coverage/rcov

######Build steps for deployment:
export PATH=/usr/local/rvm/gems/ruby-2.1.2/bin:/usr/local/rvm/gems/ruby-2.1.2@global/bin:/usr/local/rvm/rubies/ruby-2.1.2/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/rvm/bin:/home/vagrant/bin;

export APP_NAME=whatever_your_app_name_is;

export HEROKU_API_KEY=your_heroku_key;

bundle install --path ./;

bundle exec rake deploy;
