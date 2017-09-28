class User < ActiveRecord::Base
  has_many :todos
  has_many :categories

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
  validates :email, presence: true
end
