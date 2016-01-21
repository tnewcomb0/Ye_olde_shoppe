require 'faker'

10.times do

  # Create users
  user = User.create!({
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
    })

  # Create addresses
  (rand(2) + 1).times do
    address = Address.create!({
      shipping_name: "#{user.first_name} #{user.last_name}",
      shipping_address: Faker::Address.street_address,
      shipping_city: Faker::Address.city,
      shipping_state: Faker::Address.state_abbr,
      shipping_zip: Faker::Address.zip
      })

    user.addresses << address

      # Create orders
      3.times do
        order = Order.create!({
          address_id: address.id,
          user_id: user.id,
          total_price: (rand(2000)+1)
          })

        user.orders << order

      # Create finished shopping carts
      2.times do
        ShoppingCart.create!({
          user_id: user.id,
          product_id: (rand(19)+1),
          quantity: (rand(3)+1),
          order_id: order.id
          })
      end
    end
  end
end
  # Create products
  20.times do
    Product.create!({
      title: Faker::Commerce.product_name,
      price: ((Faker::Commerce.price).to_i)/10,
      photo_url: 'http://www.hercampus.com/sites/default/files/2013/02/27/topic-1350661050.jpg',
      category_id: (rand(9)+1)
      })
    end
  # Create Categories
  10.times do
    Category.create!({
      title: Faker::Hacker.noun
      })
  end
  # Create active shopping carts
  10.times do
    ShoppingCart.create!({
      user_id: (rand(9)+1),
      product_id: (rand(19)+1),
      quantity: (rand(3)+1)
      })
  end


