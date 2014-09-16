Given(/^I am on the SydneyTesters Life Insurance page$/) do
  visit "/"
  fill_in 'email', :with => "test@gmail.com"
  fill_in 'password', :with => "1234456"
  click_button 'Login'
  expect(page).to have_content('Sydney Testers Insurance')
  click_on "getlifequote"
  expect(page).to have_content('Sydney Testers Life Insurance')
end

When(/^I submit my  details '(\d+)', '(.*?)', '(.*?)' & '(.*?)' for a life insurance quote$/) do | age, gender, state, occupation |
  fill_in 'age', :with => age
  choose(gender)
  select(occupation, :from => 'occupation')
  select(state, :from => 'state')
  fill_in 'email', :with => "test@gmail.com"
  click_button 'Get Quote'
end

When(/^I submit my '(.*)' with incorrect values$/) do | age |
  fill_in 'age', :with => age
end

Then(/^I should see the correct '(.*)' shown$/) do | premium |
  expect(page).to have_content(premium)
end

When(/^I enter a.*valid email '(.*)'$/) do | email |
  fill_in 'email', :with => email
end

Then(/^I should see an error message that the '(.*)'$/) do | error_message |
  expect(page).to have_content(error_message)
end

Then(/^I should not see an error message that the '(.*)'$/) do | error_message |
  expect(page).to_not have_content(error_message)
end

Then(/^when I purchase it with my credit card$/) do
  click_on "payment"
  expect(page).to have_content("Sydney Testers Insurance Payment")
  fill_in 'cardholdername', :with => "Mr CardOwner"
  fill_in 'username', :with => "card@owner.com"
  fill_in 'password', :with => "password"
  fill_in 'cc', :with => "5520603021236550"
  select("Nov (11)", :from => 'expiry-month')
  select("2017", :from => 'expiry-year')
  fill_in 'cvv', :with => "999"
  click_button 'Pay Now'
end

Then(/^I should see a '(.*?)' message$/) do | success_message |
  expect(page).to have_content(success_message)
end