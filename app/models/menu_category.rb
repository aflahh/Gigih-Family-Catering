class MenuCategory < ApplicationRecord
  belongs_to :menu
  belongs_to :category

  validates :menu, presence: true
  validates :category, presence: true
end
