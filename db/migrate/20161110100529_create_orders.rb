class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_no
      t.integer :customer_id
      t.decimal :total
      t.date :date

      t.timestamps null: false
    end
  end
end
