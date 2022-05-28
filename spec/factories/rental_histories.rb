FactoryBot.define do
  factory :rental_history do
    start_date { "2022-05-21" }
    return_date { "2022-05-21" }

    user
    book
  end

  factory :rental_history_json, class: Hash do |_h|
    user_id { 1 }
    book_id { 1 }
    start_date { "2022-04-16" }
    return_date { "2022-04-30" }

    initialize_with { attributes }
  end
end
