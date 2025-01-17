FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city {'札幌' }
    house_number { '1-1' }
    building_name { '柏ハイツ' }
    telephone_number {'09012345678'}
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
