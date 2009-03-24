require 'rubygems'
ENV["RAILS_ENV"] = "test"
gem "webrat", ">= 0.4.0"
require 'webrat'
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'factories', 'factory_helpers'))
require 'webrat/core/matchers'

World do |world|
  world.extend FactoryHelpers
end
