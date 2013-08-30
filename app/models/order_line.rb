class OrderLine < ActiveRecord::Base
  belongs_to :order, inverse_of: :order_lines
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :product, presence: true
  validates :order, presence: true
end
