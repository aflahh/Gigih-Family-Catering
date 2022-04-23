FactoryBot.define do
  factory :customer_order do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    total_price { 750.0 }
    status { "NEW" }
  end
end
