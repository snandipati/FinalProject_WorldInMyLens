class AddCvvCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cvv_code, :integer
  end
end
