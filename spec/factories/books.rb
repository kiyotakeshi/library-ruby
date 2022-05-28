FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyString" }
    published { "2022-05-21" }
    rent { false }
    return_date { "2022-05-21" }
  end

  factory :book_with_categories_json, class: Hash do |_h|
    title { "ruby beginner" }
    description { "ruby 3.0" }
    published { "2022-05-21" }
    rent { false }
    return_date {}
    categories do
      [
        {
          category_id: 1
        }
      ]
    end

    initialize_with { attributes }
  end
end
