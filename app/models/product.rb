class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :order_lines
  has_many :orders, through: :order_lines
end
