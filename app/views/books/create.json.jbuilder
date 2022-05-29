json.books do
  json.id @book.id
  json.title @book.title
  json.description @book.description
  json.published_date @book.published_date
  json.rent @book.rent
  json.return_date @book.return_date
  json.categories @book.categories.to_a do |category|
    json.id category.id
    json.name category.name
  end
end
