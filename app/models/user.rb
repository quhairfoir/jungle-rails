class User < ActiveRecord::Base

  has_many :orders

  validates :first_name, :last_name, :password, presence: true
  
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  
  before_save { self.email = email.downcase }

end
