class Client < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :address, presence: true, length: { maximum: 255 }

  has_many :orders
end
