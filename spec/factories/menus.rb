FactoryBot.define do
  factory :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description[0..140]}
    price { 25000.0 }
  end
end
