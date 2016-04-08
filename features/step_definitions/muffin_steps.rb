require 'rest-client'

When(/^I check the muffin API status$/) do
  @result = RestClient.get "http://localhost:8080/"
end

Then(/^I should receive a successful result$/) do
  expect(@result.code).to be_between(200, 299).inclusive
end

Given(/^the muffin application is running$/) do
  @muffin = Muffin.new('localhost:8080')
  expect(@muffin).to be_running
end

When(/^I create a muffin$/) do
  @result = @muffin.create("pistachio", "Megan", "Evun")
end

When(/^I try to get a muffin with an invalid id$/) do
  url = 'http://localhost:8080/muffins/non-existent-muffin'
  begin
    @result = RestClient.get url
  rescue RestClient::Exception => error
    @result = error.response
  end
end

Then(/^I receive an error (\d+)/) do |http_return_code|
  expect(@result.code).to eq http_return_code.to_i
end

When(/^(.*) buys a (.*) muffin for (.*)$/) do |purchaser, type, owner|
  @result = @muffin.create(type, owner, purchaser)
end

