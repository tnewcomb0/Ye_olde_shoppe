class User < ActiveRecord::Base
  has_secure_password
  has_many :shopping_carts
  has_many :products, through: :shopping_carts
  has_many :orders
  has_many :addresses
end
