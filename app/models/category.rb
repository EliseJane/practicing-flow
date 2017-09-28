class Category < ActiveRecord::Base
  has_many :todos
  belongs_to :user

  validates_presence_of :name
end
