class AddIndexToOrderLines < ActiveRecord::Migration
  def change
    add_index :order_lines, [:order_id, :product_id], unique: true
  end
end
