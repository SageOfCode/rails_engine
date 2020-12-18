FactoryBot.define do
  factory :item do
    name { Faker::Device.name }
    description { Faker::Device.describe }
    unit_price { Faker::Number.within(range: 1..10) }
  end
end