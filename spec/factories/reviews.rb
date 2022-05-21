FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyString" }
    rating { 1 }
    date { "2022-05-21" }

    user
    book
  end
end
