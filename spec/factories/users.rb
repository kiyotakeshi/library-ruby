FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    name { "MyString" }
    password { "MyString" }
    role_type { "admin" }
    joining_date { "2022-05-21" }
  end

  factory :user_json, class: Hash do |_h|
    name { "MyString" }
    email { "test@example.com" }
    role_type { "admin" }
    joining_date { "2022-05-21" }

    initialize_with { attributes }
  end

end
