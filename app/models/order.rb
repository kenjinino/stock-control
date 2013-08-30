class Order < ActiveRecord::Base
  belongs_to :client

  has_many :order_lines, inverse_of: :order
  has_many :products, through: :order_lines

  accepts_nested_attributes_for :order_lines
end
