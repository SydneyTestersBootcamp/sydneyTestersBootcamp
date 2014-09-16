Given(/^I am on the SydneyTesters Car Insurance page$/) do
  visit "/"
  fill_in 'email', :with => "test@gmail.com"
  fill_in 'password', :with => "1234456"
  click_button 'Login'
  expect(page).to have_content('Sydney Testers Insurance')
  click_on "getcarquote"
  expect(page).to have_content('Sydney Testers Car Insurance')
end

When(/^I submit my  details '(\d+)', '(.*?)', '(.*?)' & '(.*?)' for a car insurance quote$/) do | age, gender, state, make |
  select(make, :from => 'make')
  fill_in 'year', :with => "2000"
  fill_in 'age', :with => age
  choose(gender)
  select(state, :from => 'state')
  fill_in 'email', :with => "test@gmail.com"
  click_button 'Get Quote'
end