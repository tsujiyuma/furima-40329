FactoryBot.define do
  factory :order_purchase do
    token                 { 'tok_visa' }
    post_code             { format('%03d-%04d', rand(999), rand(9999)) }
    prefecture_id         { Faker::Number.between(from: 1, to: 47) }
    municipality          { Faker::Address.city }
    street_addres         { Faker::Address.street_address }
    building_name         { Faker::Address.building_number }
    photo_num             { Faker::PhoneNumber.subscriber_number(length: 10) }
  end
end
