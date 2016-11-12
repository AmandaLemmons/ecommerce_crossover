class AddOrderStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_status_id, :integer
    change_column :orders, :total, :decimal, :precision => 12, :scale => 2
    change_column :products, :price, :decimal, :precision => 12, :scale => 2
    change_column :order_lines, :unit_price, :decimal, :precision => 12, :scale => 2
    change_column :order_lines, :total_price, :decimal, :precision => 12, :scale => 2



  end
end
