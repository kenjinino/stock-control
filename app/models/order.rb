class Order < ActiveRecord::Base
  belongs_to :client

  has_many :order_lines
  has_many :products, through: :order_lines
end
