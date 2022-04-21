class Menu < ApplicationRecord
  has_many :menu_categories, dependent: :destroy
  has_many :categories, through: :menu_categories
  
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }

  def self.by_letter(letter)
    where("name LIKE ?", "%#{letter}%").order(:name)
  end
end
