class CreateJoinTableShoppingCart < ActiveRecord::Migration
  def change
    create_join_table :users, :products, table_name: :shopping_carts do |t|
      t.index [:user_id, :product_id]
      t.index [:product_id, :user_id]
      t.integer :order_id
      t.integer :quantity
    end
  end
end
