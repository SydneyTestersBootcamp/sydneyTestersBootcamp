####Session 3: Continuous Integration with Jenkins

The aim of this session is to set up a CI Server & agent (Jenkins) to start a build and run tests everytime a developer checks in code.

Contents:
- What is CI and why is it needed?
- Setting up a CI server (Jenkins)
- Configuring CI agents (Jenkins)
- Building and running tests automatically on every checkin.
- What is CD? Why is it needed?
- Demo CD (to Heroku?).


####Reading Material

1. Martin Fowler's article on Continous Integration:

http://www.martinfowler.com/articles/continuousIntegration.html
2. Wikipedia:

http://en.wikipedia.org/wiki/Continuous_integration

Internal reference:
http://blog.howareyou.com/post/62157486858/continuous-delivery-with-docker-and-jenkins-part-i


####Pre-requisites

######1. Install the below software. Google them to find installers.

1. Virtualbox **
2. Vagrant **
3. Git

** If you attended last week's session on Provisioning Environments, you'd already have these. We'll use some of what you learned there to build the CI server and agent VMs.

######2. Create an account on github.com if you dont already have one.

######3. Clone the repository to your local machine
`git clone https://github.com/hdushan/quickquote.git`

######4. Set up the VM's that we'll use for the workshop (Seperate VM's to run the CI Server and CI Agent)
`cd 03_ContinuousIntegration\CI_Server`
`vagrant up`
This downloads a Vritualbox VM ~500 MB in size, installs a few packages onto it, and starts it up. This may take a long time, so please do this before coming for the session. You may want to do this on a wifi connection due to the large data download.

Once the above is done, run `vagrant ssh` to ssh into the VM. Run the command `java -version` and ensure it reports 1.7 or so.

Now run the command `exit` to exit out of the ssh session. Once back in your local machine command prompt, run `vagrant down` to shut down the VM.

