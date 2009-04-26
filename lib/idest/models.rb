require 'dm-core'
require 'dm-validations'
require 'dm-timestamps'

# Other models
$: << File.expand_path(File.dirname(__FILE__))

class User
  include DataMapper::Resource
end

class Task
  include DataMapper::Resource
end

class Estimate
  include DataMapper::Resource
end

require 'user'
require 'task'
require 'estimate'
require 'note'
