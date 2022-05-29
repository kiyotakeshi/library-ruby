FactoryBot.define do
  factory :review do
    title { "MyString" }
    content { "MyString" }
    rating { 1 }
    date { "2022-05-21" }

    user
    book
  end

  factory :review_json, class: Hash do |_h|
    book_id { 1 }
    user_id { 1 }
    title { "MyString" }
    content { "MyString" }
    rating { rand(1..5) }
    date { "2022-05-21" }

    initialize_with { attributes }
  end

  factory :review_update_json, class: Hash do |_h|
    title { "MyString" }
    content { "MyString" }
    rating { rand(1..5) }
    date { "2022-05-21" }

    initialize_with { attributes }
  end

end
