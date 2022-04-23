class OrderDetail < ApplicationRecord
  belongs_to :menu
  belongs_to :customer_order

  validates :menu, presence: true
  validates :customer_order, presence: true
end
