require 'dm-core'
require 'dm-validations'
require 'dm-timestamps'

class User
  include DataMapper::Resource
end

class Task
  include DataMapper::Resource
end

class Estimate
  include DataMapper::Resource
end


