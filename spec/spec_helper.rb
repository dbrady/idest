# TODO: Convert this to sinatra if necessary
# ENV["RAILS_ENV"] = "test"
$: << File.expand_path(File.join(File.dirname(__FILE__), '../lib'))
require 'spec'
require 'script_tools'

# TODO: Convert this to sinatra
# require 'spec/rails'
# TODO: Convert this to factory girl!
# require File.expand_path(Rails.root + "/features/factories/fixjour_definitions.rb")

require_all_files_in_folder "spec/spec_helpers"

require 'ruby-debug'
require File.dirname(__FILE__) + "/../lib/idest/models"

Spec::Runner.configure do |config|
  
  [:process, :action, :post].each do |action|
  eval %Q{
    def before_#{action}
      yield
      do_#{action}
    end
    alias during_#{action} before_#{action}
    alias when_#{action} before_#{action}
    def after_#{action}
      do_#{action}
      yield
    end
    }
  end

  # == Fixtures
  #
  # You can declare fixtures for each example_group like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so right here. Just uncomment the next line and replace the fixture
  # names with your fixtures.
  #
  # config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
  #
  # You can also declare which fixtures to use (for example fixtures for test/fixtures):
  #
  # config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  #
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #
  # == Notes
  # 
  # For more information take a look at Spec::Example::Configuration and Spec::Runner
end
