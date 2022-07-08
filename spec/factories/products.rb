FactoryBot.define do
  factory :product do
    title { "MyString" }
    description { nil }
    price { 1 }
    condition { 1 }
    sold { false }
    user { nil }
    category { nil }
  end
end
