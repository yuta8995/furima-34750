FactoryBot.define do
  factory :buyer_address do
    postal_code      {'123-4567'}
    item_location_id {1}
    municipality     {'品川区'}
    house_number     {'豊町1-2-3'}
    building_name    {'建物名'}
    tel              {'08012345678'}
    token            {'tok_abcdefghijk00000000000000000'}
  end
end
