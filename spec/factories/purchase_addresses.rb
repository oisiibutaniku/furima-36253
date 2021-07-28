FactoryBot.define do
  factory :purchase_address do
  association :user
  association :item
        token             {'tok_abcdefghijk00000000000000000'}
        postal_code       { '123-4567' }
        prefecture_id     {3}
        city              { '札幌市' }
        street            { '1-1' }
        building          { '東京ハイツ' }
        phone             { '09012345678' }
      end
    end
    
    
