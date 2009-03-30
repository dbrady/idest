require "task"

class Estimate
  include DataMapper::Resource

  property :id, Serial, :protected => true
  property :hours, Integer
  property :completed_at, DateTime
  property :confidence, Integer
  property :created_at, DateTime
  belongs_to :task, :class_name => "Task"
end
