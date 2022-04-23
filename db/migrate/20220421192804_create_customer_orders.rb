class CreateCustomerOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_orders do |t|
      t.string :name
      t.string :email
      t.string :total_price
      t.string :status

      t.timestamps
    end
  end
end
