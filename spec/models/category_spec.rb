require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:category)).to be_valid
  end
  
  it 'is valid with name' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is invalid without name' do
    category = FactoryBot.build(:category, name: nil)
    
    category.valid?
    
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with duplicate name' do
    FactoryBot.create(:category, name: 'Makanan')

    category = FactoryBot.build(:category, name: 'Makanan')
    
    category.valid?
    
    expect(category.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with name less than 3 characters' do
    category = FactoryBot.build(:category, 
      name: 'AB')

    category.valid?
    
    expect(category.errors[:name]).to include("is too short (minimum is 3 characters)")
  end

  it 'has many Menu' do
    category = Category.reflect_on_association(:menus)
    
    expect(category.macro).to eq(:has_many)
  end
end
