class Todo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, optional: true

  validates_presence_of :title, :description, :duedate
end
