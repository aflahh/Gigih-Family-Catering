class Menu < ApplicationRecord
  has_many :menu_categories, dependent: :destroy
  has_many :categories, through: :menu_categories
  has_many :order_details, dependent: :destroy
  has_many :customer_orders, through: :order_details
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }

  validates_associated :categories

  def self.by_letter(letter)
    where("name LIKE ?", "%#{letter}%").order(:name)
  end
end
