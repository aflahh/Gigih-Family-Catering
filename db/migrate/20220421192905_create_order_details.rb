class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.string :customer_order_id
      t.string :menu_id
      t.string :price
      t.string :qty

      t.timestamps
    end
  end
end
