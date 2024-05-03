FactoryBot.define do
  factory :subscription do
    title { Faker::Commerce.name }
    price { Faker::Commerce.price(range: 10..100.0)}
    status { :active }
    frequency { ["weekly", "monthly", "yearly"].sample }
    association :customer
    association :tea
  end
end
