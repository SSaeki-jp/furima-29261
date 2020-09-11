FactoryBot.define do
  factory :product do
    name                       { Faker::Book.title }
    explanation                { Faker::Book.genre }
    category_id                { '2' }
    product_status_id          { '2' }
    shipping_charges_id        { '2' }
    prefecture_id              { '2' }
    estimated_shipping_date_id { '2' }
    favorite_flag              { false }
    price                      { '300' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
