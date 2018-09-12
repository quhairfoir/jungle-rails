class User < ActiveRecord::Base

  has_many :orders

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true
end
