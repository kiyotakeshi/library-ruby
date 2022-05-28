FactoryBot.define do
  factory :category do
    name { "MyString" }
  end

  factory :category_json, class: Hash do |_h|
    name { "ruby" }
  end

  initialize_with { attributes }
end
