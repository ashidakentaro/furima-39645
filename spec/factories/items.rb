FactoryBot.define do
  factory :item do
    title         {'商品名'}
    explanation   {'商品の説明'}
    price         {'300'}
    category_id   {'2'}
    condition_id  {'2'}
    charge_id     {'2'}
    prefecture_id {'2'}
    leadtime_id   {'2'}
    association :user

    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('app', 'assets', 'images', 'furima-intro01.png'),
        'image/png'
      )
    end
  end
end
