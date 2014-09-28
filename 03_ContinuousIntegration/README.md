####Session 3: Continuous Integration with Jenkins

The aim of this session is to set up a CI Server & agent (Jenkins) to start a build and run tests everytime a developer checks in code. 

This workshop follows on from last week's session about provisioning environments (using chef & vagrant to manage virtualbox VMs). We'll use some of what you learned there to build the CI server and agent VMs.

Contents:
- What is CI and why is it needed?
- Setting up a CI server (Jenkins)
- Configuring CI agents (Jenkins)
- Building and running tests automatically on every checkin.
- What is CD? Why is it needed?
- Demo CD (to Heroku?).


####Reading Material

######Martin Fowler's article on Continous Integration:

http://www.martinfowler.com/articles/continuousIntegration.html

######Wikipedia:

http://en.wikipedia.org/wiki/Continuous_integration

######Internal reference:

http://blog.howareyou.com/post/62157486858/continuous-delivery-with-docker-and-jenkins-part-i


####Pre-requisites

#####1. Install the below software. Google them to find installers.

1. [Ruby](https://www.ruby-lang.org/en/) <br>(version 2.1.2 preferred)
2. [Virtualbox](https://www.virtualbox.org/) <br>This tool runs the VMs that we'll use for the workshop
3. [Vagrant](https://www.vagrantup.com/) <br>This tool manages the VMs - download and install them, start them up, shut them down etc
4. [vagrant-omnibus plugin](https://github.com/opscode/vagrant-omnibus) <br>This plugin installs chef onto the VM that doesnt already have chef installed <br>Install it from the commandline by running `vagrant plugin install vagrant-omnibus`
5. [chefdk](https://downloads.getchef.com/chef-dk) <br>This installs 'berkshelf', a tool that fetches required chef cookbooks for packages that need to be installed <br> Once installed, please make sure the path to `berks` is at the BEGINNING of your PATH variable (ie. PATH=/opt/chefdk/bin:$PATH)
6. [vagrant berkshelf plugin](http://berkshelf.com/) <br>Install it from the commandline by running `vagrant plugin install vagrant-berkshelf`
7. [test-kitchen](http://kitchen.ci/) <br>Install it from the commandline by running `gem install test-kitchen`
8. [Git](http://git-scm.com/) <br>This is the source control tool that we'll use for the workshop

NOTE: If you attended last week's session on Provisioning Environments, you'd already have most of these installed (all except for 'test-kitchen').

#####2. Create an account on [github.com](https://github.com/) if you dont already have one.

#####3. Clone the repository to your local machine
`git clone https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp`

This could take a while. You can do a shallow clone if you dont want to clone the whole history of the repo (add the flag `--depth 1`).

#####4. Set up the CI Server VM that we'll use for the workshop
`cd 03_ContinuousIntegration\CI_Server`

and then:

`vagrant up`

This downloads a Vritualbox VM ~500 MB in size, installs a few packages onto it, and starts it up. This may take a long time, so <b>please do this before coming for the session</b>. You may want to do this on a wifi connection due to the large data download.

Once the above is done, run `vagrant ssh` to ssh into the VM. Run the command `java -version` and ensure it reports 1.7 or so.

Now run the command `exit` to exit out of the ssh session. Once back in your local machine command prompt, run `vagrant down` to shut down the VM.

#####5. Set up the CI Agent VM that we'll use for the workshop
`cd 03_ContinuousIntegration\CI_Agent`

and then:

`vagrant up`

This downloads a Vritualbox VM ~500 MB in size, installs a few packages onto it, and starts it up. This may take a long time, so <b><font color="red">please do this before coming for the session</font></b>. You may want to do this on a wifi connection due to the large data download.

Once the above is done, run `vagrant ssh` to ssh into the VM. Run the command `java -version` and ensure it reports 1.7 or so.

Now run the command `exit` to exit out of the ssh session. Once back in your local machine command prompt, run `vagrant down` to shut down the VM.

####Common issues
- RuntimeError: Couldn't determine Berks version<br>
You would need to add /opt/chefdk/bin at the front of your PATH