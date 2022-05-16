json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.description book.description
  json.published book.published
  json.rent book.rent
  json.return_date book.return_date

  # TODO: relation の描画をしたい
  json.reviews book.reviews do |review|
    #   json.partial! "reviews/review", review: book.reviews
    review.id
    review.title
    review.description
    review.rating
    review.date
  end
end
