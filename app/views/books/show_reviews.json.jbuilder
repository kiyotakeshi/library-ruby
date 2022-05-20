json.reviews @book_reviews do |review|
  json.id review.id
  json.title review.title
  json.content review.content
  json.rating review.rating
  json.date review.date
  json.user_id review.user_id
end

