class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :integer
    remove_column :orders, :order_status_id, :integer
  end
end
