# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.create(name: 'Makanan')
Category.create(name: 'Goreng')
Category.create(name: 'Minuman')
Menu.create(name: 'Nasi Goreng', price: '25.000', description: 'Nasi digoreng')
Menu.create(name: 'Es Teh', price: '10.000', description: 'Teh dikasih es')
MenuCategory.create(menu_id: 1, category_id: 1)
MenuCategory.create(menu_id: 1, category_id: 2)
MenuCategory.create(menu_id: 2, category_id: 3)