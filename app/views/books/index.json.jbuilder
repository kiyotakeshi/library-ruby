json.books @books do |book|
  json.id book.id
  json.title book.title
  json.description book.description
  json.published book.published
  json.rent book.rent
  json.return_date book.return_date
  # json.reviews book.reviews.to_a do |review|
  #   json.id review.id
  #   json.title review.title
  #   json.description review.description
  #   json.rating review.rating
  #   json.date review.date
  #   json.user_id review.user_id
  # end
end
