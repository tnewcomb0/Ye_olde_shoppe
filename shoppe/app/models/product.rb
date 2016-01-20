class Product < ActiveRecord::Base
  belongs_to :category
  has_many :shopping_carts
end
