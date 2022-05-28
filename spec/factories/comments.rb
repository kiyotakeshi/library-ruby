FactoryBot.define do
  factory :comment do
    content { "MyText" }
    favorite_count { 1 }
    date { "2022-05-21" }
    edited { false }

    review
    user
  end

  factory :review_comment_json, class: Hash do |_h|
    user_id { 1 }
    review_id { 1 }
    content { "nice sharing!!" }
    date { "2022-05-28" }

    initialize_with { attributes }
  end
end
