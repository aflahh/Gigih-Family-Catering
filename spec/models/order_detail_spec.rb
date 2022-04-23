require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
it 'has a valid factory' do
    FactoryBot.create(:customer_order)
    FactoryBot.create(:menu)
    
    expect(FactoryBot.build(:order_detail)).to be_valid
  end

  it 'is valid with customer order and menu' do
    FactoryBot.create(:customer_order)
    FactoryBot.create(:menu)
    
    expect(FactoryBot.build(:order_detail)).to be_valid
  end

  it 'is invalid without customer order' do
    FactoryBot.create(:customer_order)
    FactoryBot.create(:menu)
    
    order_detail = FactoryBot.build(:order_detail, customer_order: nil)
    
    order_detail.valid?
    
    expect(order_detail.errors[:customer_order]).to include("can't be blank")
  end

  it 'is invalid without menu' do
    FactoryBot.create(:customer_order)
    FactoryBot.create(:menu)
    
    order_detail = FactoryBot.build(:order_detail, menu: nil)
    
    order_detail.valid?
    
    expect(order_detail.errors[:menu]).to include("can't be blank")
  end

  it 'belongs to Customer Order' do
    order_detail = OrderDetail.reflect_on_association(:customer_order)
    
    expect(order_detail.macro).to eq(:belongs_to)
  end

  it 'belongs to Menu' do
    order_detail = OrderDetail.reflect_on_association(:menu)
    
    expect(order_detail.macro).to eq(:belongs_to)
  end
end
