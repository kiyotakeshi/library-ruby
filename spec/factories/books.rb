FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyString" }
    published { "2022-05-16" }
    rent { false }
    return_date { "2022-05-16" }
  end
end
