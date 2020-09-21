FactoryBot.define do
  factory :product_order do
    token         { '0123456789' }
    postal_code   { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { '2' }
    city          { Gimei.address.city.kanji }
    address       { Gimei.address.town.kanji + '1-1-1' }
    building_name { Gimei.address.town.kanji + '200号室' }
    phone_number  { Faker::Number.number(digits: 11).to_s }
    user_id       { '1' }
    product_id    { '1' }
  end
end
