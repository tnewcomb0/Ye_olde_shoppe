class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zip

      t.timestamps null: false
    end
  end
end
