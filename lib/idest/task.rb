class Task
  include DataMapper::Resource

  property :id, Serial, :protected => true
  property :name, String, :key => true, :nullable => false, :length => (5..255)
  property :description, Text
  property :created_at, DateTime
  belongs_to :user, :class_name => "User"
end