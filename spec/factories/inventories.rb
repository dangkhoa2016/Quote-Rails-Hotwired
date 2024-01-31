FactoryBot.define do
  factory :inventory do
    quote { nil }
    quantity { 1 }
    location { "MyString" }
    purchase_date { "2024-01-31" }
    purchase_price { "9.99" }
    expiration_date { "2024-01-31" }
    manufacturer { "MyString" }
    serial_number { "MyString" }
    notes { "MyText" }
  end
end
