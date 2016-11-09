Given(/^there's a tag named "([^"]*)"$/) do |arg1|
   @tag = FactoryGirl.create(:tag, name: name)
end

When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see the "([^"]*)" tag$/) do |arg1|
  
  @tag = Tag.find_by_name(name)
  expect(page).to have_content(@tag.name)
  
end