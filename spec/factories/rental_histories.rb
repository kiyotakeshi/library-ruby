FactoryBot.define do
  factory :rental_history do
    start_date { "2022-05-21" }
    return_date { "2022-05-21" }

    user
    book
  end
end
