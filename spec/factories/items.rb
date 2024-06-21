FactoryBot.define do
  factory :item do
    item_name{"テスト"}
    category_id{2}
    price{2000}
    detail{"詳しく"}
    condition_id{2}
    burden_id{2}
    prefecture_id{2}
    delivery_date_id{2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
