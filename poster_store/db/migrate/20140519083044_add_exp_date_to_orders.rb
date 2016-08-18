class AddExpDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :exp_date, :integer
  end
end
