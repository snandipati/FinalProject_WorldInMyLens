class AddCardTypeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_type, :string
  end
end
