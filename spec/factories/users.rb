FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'000000a'}
    password_confirmation {'000000a'}
    c_family_name         {'田中'}
    c_first_name          {'太郎'}
    k_family_name         {'タナカ'}
    k_first_name          {'タロウ'}
    birthday              {'2020/10/01'}
  end
end
