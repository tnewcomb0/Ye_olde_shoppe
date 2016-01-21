class Order < ActiveRecord::Base
  has_many :shopping_carts
  belongs_to :user
end
