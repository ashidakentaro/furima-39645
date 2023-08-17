FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {"1" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'みょうじ'}
    family_name_kana      {'ミョウジ'}
    first_name            {'なまえ'}
    first_name_kana       {'ナマエ'}
    birthday              {Faker::Date.birthday}
  end
end