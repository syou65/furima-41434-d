FactoryBot.define do
  factory :item do
    title                 {'test'}
    detail                {"テスト"}
    category_id              { 2 }
    situation_id             { 2 }
    shipping_charge_id       { 2 }
    prefecture_id            { 13 }
    shipping_day_id          { 13 }
    price                  { 5000 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
