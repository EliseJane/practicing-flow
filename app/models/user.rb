class User < ActiveRecord::Base
  has_many :todos

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end
