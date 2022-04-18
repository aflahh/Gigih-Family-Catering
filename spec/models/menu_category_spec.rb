require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  it 'has a valid factory' do
    FactoryBot.create(:category)
    FactoryBot.create(:menu)
    
    expect(FactoryBot.build(:menu_category)).to be_valid
  end

  it 'is valid with category_id and menu_id' do
    FactoryBot.create(:category)
    FactoryBot.create(:menu)
    
    expect(FactoryBot.build(:menu_category)).to be_valid
  end

  it 'is invalid without category_id' do
    FactoryBot.create(:category)
    FactoryBot.create(:menu)
    
    menu_category = FactoryBot.build(:menu_category, category_id: nil)
    
    menu_category.valid?
    
    expect(menu_category.errors[:category_id]).to include("can't be blank")
  end

  it 'is invalid without menu_id' do
    FactoryBot.create(:category)
    FactoryBot.create(:menu)
    
    menu_category = FactoryBot.build(:menu_category, menu_id: nil)
    
    menu_category.valid?
    
    expect(menu_category.errors[:menu_id]).to include("can't be blank")
  end

  it 'belongs to Category' do
    menu_category = MenuCategory.reflect_on_association(:category)
    
    expect(menu_category.macro).to eq(:belongs_to)
  end

  it 'belongs to Menu' do
    menu_category = MenuCategory.reflect_on_association(:menu)
    
    expect(menu_category.macro).to eq(:belongs_to)
  end
end
