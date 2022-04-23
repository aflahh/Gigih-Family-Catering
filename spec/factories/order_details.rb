FactoryBot.define do
  factory :order_detail do
    customer_order_id { 1 }
    menu_id { 1 }
    price { 50.0 }
    qty { 2 }
  end
end
