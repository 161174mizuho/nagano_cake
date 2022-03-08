class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shopping_postal_code
      t.string :shopping_address
      t.string :shopping_name
      t.integer :shopping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_status, default: 0
      t.timestamps
    end
  end
end
