class User < ActiveRecord::Base
  has_secure_password
  has_many :shopping_carts
  has_many :products, through: :shopping_carts
  has_many :orders
  has_many :addresses

  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true
end
