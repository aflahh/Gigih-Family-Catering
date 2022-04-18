require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menu)).to be_valid
  end
  
  it 'is valid with name, price, and description' do
    expect(FactoryBot.build(:menu)).to be_valid
  end
  
  it 'is valid with name and price' do
    menu = FactoryBot.build(:menu, description: nil)

    expect(menu).to be_valid
  end

  it 'is invalid without price' do
    menu = menu = FactoryBot.build(:menu, price: nil)
    
    menu.valid?
    
    expect(menu.errors[:price]).to include("is not a number")
  end

  it 'is invalid without name' do
    menu = FactoryBot.build(:menu, name: nil)
    
    menu.valid?
    
    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with duplicate name' do
    FactoryBot.create(:menu, name: 'Nasi Goreng')

    menu = FactoryBot.build(:menu, name: 'Nasi Goreng')
    
    menu.valid?
    
    expect(menu.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a non numeric values for price' do
    menu = FactoryBot.build(:menu, price: 'Nasi')
    
    menu.valid?
    
    expect(menu.errors[:price]).to include("is not a number")
  end

  it 'is invalid with price less than 0.01' do
    menu = FactoryBot.build(:menu, price: 0.005)
    
    menu.valid?
    
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it 'is invalid with description more than 150 characters' do
    menu = FactoryBot.build(:menu, 
      description: 'Three egg whites with spinach, mushrooms, caramelized onions, tomatoes and low-fat feta cheese. With herbed quinoa, and your choice of rye or whole-grain')

    menu.valid?
    
    expect(menu.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  it 'has many Category' do
    menu = Menu.reflect_on_association(:categories)
    
    expect(menu.macro).to eq(:has_many)
  end
end
