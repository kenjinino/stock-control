class OrderLine < ActiveRecord::Base
  belongs_to :order, inverse_of: :order_lines
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :product_id, presence: true, uniqueness: { scope: :order_id }
  validates :order_id, presence: true
end
