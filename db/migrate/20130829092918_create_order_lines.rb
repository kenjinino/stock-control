class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :order, index: true
      t.references :product, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
