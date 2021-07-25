FactoryBot.define do
  factory :item do
    association :user
        product           {Faker::Lorem.sentence}
        explanation       {Faker::Lorem.sentence}
        category_id       {2}
        state_id          {2}
        burden_id         {2}
        prefecture_id     {2}
        day_id            {2}
        price             {5000}
    
    
  end
end
