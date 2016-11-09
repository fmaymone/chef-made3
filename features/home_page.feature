Feature: Home page

Scenario: Viewing application's home page
Given there's a tag named "Brasil" 
When I am on the homepage
Then I should see the "Brasil" tag