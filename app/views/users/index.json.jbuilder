# json.users @users
json.users @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.role_type user.role_type
  json.joining_date user.joining_date
end
