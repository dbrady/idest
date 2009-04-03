Feature: Login

    In order to use the website
    As a user
    I want to log in and out

    Scenario: Redirect to login
        Given user accounts are set up
        And I visit '/'
        Then I should see 'login'

    Scenario: Logged in
        Given user accounts are set up
        When I visit '/logged_in'
        Then I should see 'false'
        And I visit '/'
        Then I should see 'login'
        And I log in as 'test@example.com'
        When I visit '/logged_in'
        Then I should see 'true'
