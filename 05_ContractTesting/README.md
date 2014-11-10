####Session 5: Consumer driven contract testing with pact

The aim of this session is to learn about contract testing and see how the Pact consumer driven contract testing tool can be used to help run these kinds of tests.

This workshop follows on from the first week's session about running rspec unit tests. We'll use some of what you learned there to add contract tests to our otherwise tested Sydney testers insurance quote web app.

Contents:
- What kind of tests have we run on our web app
- Is there an alternative to integration testing
- What's a contract test
- pact for consumer driven contract testing
- Pact in action!


####Reading Material

######Martin Fowler's article on <a href="http://martinfowler.com/bliki/IntegrationContractTest.html" target="_blank">Integration contract tests</a>

######Pact <a href="https://github.com/realestate-com-au/pact/blob/master/README.md" target="_blank">GitHub page</a>


####Pre-requisites

#####1. Install the below software.

Note: 
- Some of you will already have the below software from previous sessions. Double check and then jump to step 5.

| Tool/Software | Notes | How to test if this is installed fine |
| ------------- | ----- | ------------------------------------- |
| OSX/Linux: <br><a href="https://www.ruby-lang.org/en/" target="_blank">Ruby</a><br><br>Windows: <br><a href="http://rubyinstaller.org/downloads/" target="_blank">Ruby</a> | Install Version 2.1.2 or 2.1.3. | Run `ruby --version` at Command Prompt/Terminal. <br><br>Expected outcome: Should report a version `2.1.2` or greater. |
| For Windows user only!<br<br>OSX & Linux users can skip this step<br><br><a href="http://rubyinstaller.org/downloads" target="_blank">DevKit</a> | This package is to support Ruby to build native package (for gem installation).<br><br>You should choose a folder with no spaces as the destination for the kit. i.e C:\Hashicorp\DevKit <br><br>Once installed, go to the DevKit folder in your command prompt, and run `devkitvars.bat`. | Not sure how to test this. |
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

This cloning could take a while. Once done, go into the session folder in your Command Prompt/Terminal<br> `cd sydneyTestersBootcamp/05_ContractTesting`.

#####5. Update the forked repository into your local machine (This step is only for those of you who already have forked/cloned in previous sessions. If you just did step 4, then you do not need to do this).

On your machine, open the command prompt or Terminal, go to the folder where you had cloned the repo into (eg: `cd sydneyTestersBootcamp`).<br>

Add a remote alias 'upstream' pointing to the original repo that you forked from:<br>
`git remote add upstream https://github.com/SydneyTestersBootcamp/sydneyTestersBootcamp.git`

Now pull in the latest changes from the original repo:<br>
`git pull -s recursive -X theirs upstream master`

If you see an error message that looks like "Please, commit your changes or stash them before you can merge. Aborting", then run:
`git stash` and try the git pull again.

#####6. Update your ruby gems
`cd sydneyTestersBootcamp/05_ContractTesting`<br>
`bundle install`<br>
If you have ruby version 2.1.2 (I  have 2.1.3) you will need to edit your Gemfile and replace `ruby '2.1.3'` with `ruby '2.1.2'` and run bundle install again.

