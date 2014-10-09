Given(/^I visit SydneyTesters Life Insurance page$/) do
  visit('http://sydneytesters.herokuapp.com/login')
end

When(/^I fill email with "(.*?)"$/) do |username|
  fill_in('username', :with => 'test@mailinator.com')
end

When(/^I fill password with "(.*?)"$/) do |password|
  fill_in('password', :with => '123456')
end

When(/^I click "(.*?)"$/) do |login|
  click_button 'login'
end

Then(/^I should see a '(.*?)' message$/) do |success_message|
  expect(page). to have_content(success_message)
end
