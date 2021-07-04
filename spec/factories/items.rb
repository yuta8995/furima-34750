FactoryBot.define do
  factory :item do
    item_name           {'商品名'}
    item_description    {Faker::Lorem.sentence}
    category_id         {1}
    item_condition_id   {1}
    shipping_paid_by_id {1}
    item_location_id    {1}
    shipping_date_id    {1}
    price               {9999}
    association :user

    # after(:build) do |item|
      # item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
