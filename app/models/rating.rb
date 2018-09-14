class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user, :product, :description, presence: true 
  validates :rating, numericality: { greater_than: 0, less_than: 6 }
end
