class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, presence: true
  validates :rating, presence: true, numericality: { greater_than: 0, less_than: 6 }
end
