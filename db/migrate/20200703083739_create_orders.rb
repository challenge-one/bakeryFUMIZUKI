class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :addressee
      t.string :post_code
      t.string :send_to_address
      t.boolean :how_to_pay
      t.integer :deliver_fee
      t.integer :order_status

      t.timestamps
    end
  end
end
