Feature: Login

    In order to use the website
    As a user
    I want to log in and out

    Scenario: Redirect to login
        Given user accounts are set up
        And I visit '/'
        Then I should be redirected to '/login'

    Scenario: Redirect back to home
        Given user accounts are set up
        And I visit '/'
        Then I should be redirected to '/login'

        And I log in as 'test@example.com'
        Then I should be redirected to '/'
        Then I should see 'hi test@example.com'
