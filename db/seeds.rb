# Category.create(name: 'Makanan')
# Category.create(name: 'Goreng')
# Category.create(name: 'Minuman')
# Menu.create(name: 'Nasi Goreng', price: '25.000', description: 'Nasi digoreng', category_ids: [1, 2])
# Menu.create(name: 'Es Teh', price: '10.000', description: 'Teh dikasih es', category_ids: [3])
# Menu.create(name: 'Es Jeruk', price: '10.000', description: 'Jeruk dikasih es', category_ids: [3])

# CustomerOrder.create(name: 'aflah', email: 'aflah@mail.com', total_price: '25000', status: 'New', menu_ids: [1])

OrderDetail.create(customer_order_id: 4, menu_id: 3, qty: 2)