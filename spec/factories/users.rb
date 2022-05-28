FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    name { "MyString" }
    password { "MyString" }
    role_type { "admin" }
    joining_date { "2022-05-21" }
  end
end
