class Todo < ActiveRecord::Base
  validates_presence_of :title, :description, :duedate
end