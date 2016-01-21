class Product < ActiveRecord::Base
  belongs_to :category
  has_many :shopping_carts

  validates :title, presence: true
  validates :price, presence: true
end
