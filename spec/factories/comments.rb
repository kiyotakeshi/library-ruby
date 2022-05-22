FactoryBot.define do
  factory :comment do
    content { "MyText" }
    favorite_count { 1 }
    date { "2022-05-21" }
    edited { false }

    review
    user
  end
end
