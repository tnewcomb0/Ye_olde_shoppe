class ShoppingCart < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  belongs_to :product
end
