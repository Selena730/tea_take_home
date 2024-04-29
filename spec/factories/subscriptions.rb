FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { "9.99" }
    status { "" }
    frequency { "MyString" }
    customer { nil }
    tea { nil }
  end
end
