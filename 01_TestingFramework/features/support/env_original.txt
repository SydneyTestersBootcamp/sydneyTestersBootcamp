require 'capybara/cucumber'
require 'phantomjs'
require_relative '../../app'
require 'selenium-webdriver'

if ENV['USE_HEADLESS_MODE'] == "true"
  @browser = :phantomjs
else
  @browser = :chrome
end 

if ENV['RUN_TESTS_PARALLELY'] == "true"
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
      :browser => :remote,
      :url => "http://localhost:4444/wd/hub",
      :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.new({:browser_name=>@browser.to_s, :javascript_enabled=>true}))
  end
else
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => @browser)
  end
end 

Capybara.default_driver  = :selenium

if ENV['TEST_AGAINST_QA_ENV'] == "true"
  Capybara.configure do |config|
    config.run_server = false
    config.app_host   = "http://sydneytesters.herokuapp.com"
  end
else
  Capybara.server_port = 9887 + ENV['TEST_ENV_NUMBER'].to_i
  Capybara.app = App.new
end
