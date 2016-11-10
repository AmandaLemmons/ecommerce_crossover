class ChangeStatusToBoolean < ActiveRecord::Migration
  def change
    remove_column :products, :status, :string
    add_column :products, :status, :boolean
  end
end
