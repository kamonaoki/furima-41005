FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'}
    prefecture_id {2}
    city  {'鈴鹿市'}
    street_address {'1-1'}
    building_name {'鈴鹿ハイツ'}
    telephone {'00000000000'}
  end
end
