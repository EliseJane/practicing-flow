class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  validates_presence_of :title, :description, :duedate
end
