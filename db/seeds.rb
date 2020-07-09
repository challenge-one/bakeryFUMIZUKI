# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/customer.rb'
require './db/seeds/address.rb'
require './db/seeds/genre.rb'
require './db/seeds/product.rb'
require './db/seeds/order.rb'
require './db/seeds/order_item.rb'

Admin.create!(
  id: 1,
  email: 'admin@user',
  password: 'adminuser',
  password_confirmation: 'adminuser'
  )