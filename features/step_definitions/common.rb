Given /^user accounts are set up$/ do
  User.all.destroy!
  @test_user = User.create :email => 'test@example.com', :password => 'testp4ss', :password_confirmation => 'testp4ss', :created_at => Time.now
end

Given /^I log in as '(.+)'$/ do |username|
  visit '/login'
  And "I fill in 'email' with '%s'" % username
  And "I fill in 'password' with 'testp4ss'"
  And "I press 'login'"
end
