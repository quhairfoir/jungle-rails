class User < ActiveRecord::Base

  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, confirmation: true
  validates_length_of :password, minimum: 6
  validates :password_confirmation, presence: true

  def email=(value)
    value ? super(value.strip) : nil
  end

  
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
  
  before_save { self.email = email.downcase }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by email: email
    if user && user.authenticate(password)
      return user
    else
      nil
    end
  end

end