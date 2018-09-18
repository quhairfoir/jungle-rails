class User < ActiveRecord::Base

  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, confirmation: true
  validates_length_of :password, minimum: 6
  validates :password_confirmation, presence: true
  has_secure_password

  before_validation :downcase_strip_email
  
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true

  def downcase_strip_email
    if email.nil?
      return nil
    else 
      self.email = email.downcase.strip
    end
  end

  def self.authenticate_with_credentials(email, password)
    user_email = email.downcase.strip
    user = User.find_by email: user_email
    if user && user.authenticate(password)
      return user
    else
      nil
    end
  end

end