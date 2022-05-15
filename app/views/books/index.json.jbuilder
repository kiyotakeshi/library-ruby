json.array! @books do |book|
  json.id book.id
  json.title book.title
  json.description book.description
  json.published book.published
  json.rent book.rent
  json.return_date book.return_date
end
