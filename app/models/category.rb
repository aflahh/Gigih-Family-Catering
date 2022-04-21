class Category < ApplicationRecord
  has_many :menu_categories, dependent: :destroy
  has_many :menus, through: :menu_categories

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
