json.rental_histories do
  json.id @rental_history.id
  json.user_id @rental_history.user_id
  json.book_id @rental_history.book_id
  json.start_date @rental_history.start_date
  json.return_date @rental_history.return_date
  json.book_title @rental_history.book.title
end

