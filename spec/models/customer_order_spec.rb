require 'rails_helper'

RSpec.describe CustomerOrder, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:customer_order)).to be_valid
  end
  
  it 'is valid with name, email, total price, and status' do
    expect(FactoryBot.build(:customer_order)).to be_valid
  end

  it 'is invalid without name' do
    customer_order = FactoryBot.build(:customer_order, name: nil)
    
    customer_order.valid?
    
    expect(customer_order.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without email' do
    customer_order = FactoryBot.build(:customer_order, email: nil)
    
    customer_order.valid?
    
    expect(customer_order.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without total price' do
    customer_order = FactoryBot.build(:customer_order, total_price: nil)
    
    customer_order.valid?
    
    expect(customer_order.errors[:total_price]).to include("can't be blank")
  end

  it 'is invalid without status' do
    customer_order = FactoryBot.build(:customer_order, status: nil)
    
    customer_order.valid?
    
    expect(customer_order.errors[:status]).to include("can't be blank")
  end
  
  it 'has many Menu' do
    customer_order = Category.reflect_on_association(:menus)
    
    expect(customer_order.macro).to eq(:has_many)
  end
end
