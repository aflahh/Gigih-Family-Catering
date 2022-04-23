class CustomerOrder < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :menus, through: :order_details

  accepts_nested_attributes_for :order_details

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :total_price, presence: true
  validates :status, presence: true
  
  validates_associated :menus

  def self.by_letter(letter)
    where("email LIKE ?", "%#{letter}%").order(:name)
  end

  def self.by_date(date)
    where("DATE(created_at) = ?", "#{date}").order(:created_at)
  end
end
