FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'test'}
    family_name_kana      {'test'}
    first_name            {Faker::Name.first_name}
    first_name_kana       {'test'}
    birthday              {Faker::Date.birthday}
  end
end