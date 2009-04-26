require "task"

class Note
  include DataMapper::Resource

  property :id, Serial, :protected => true
  property :content, Text
  property :created_at, DateTime
  
  belongs_to :task, :class_name => "Task", :child_key => [:task_id]
  belongs_to :user, :class_name => "User", :child_key => [:user_id]
end
