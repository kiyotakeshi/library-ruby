json.reviews @user_reviews do |review|
  json.id review.id
  json.title review.title
  json.description review.description
  json.rating review.rating
  json.date review.date
  json.user_id review.user_id
end

