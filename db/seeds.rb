# frozen_string_literal: true

users = [
  # email, name, password, role_type, joining_date
  ['mike@example.com', 'mike', '1qazxsw2', 'admin', '2022-05-16'],
  ['popcorn@example.com', 'popcorn', '2wsxzaq1', 'user', '2022-05-20']
]

users.each do |email, name, password, role_type, joining_date|
  User.create(email:, name:, password:, role_type:, joining_date:)
end

books = [
  # title, description, published, rent, return_date
  ['java beginner', 'for java beginner', '2022-05-16', false, nil],
  ['ruby beginner', 'for ruby beginner', '2022-05-20', false, nil],
  ['ruby professional', 'for ruby beginner', '2022-05-20', true, '2022-06-09'],
]

books.each do |title, description, published, rent, return_date|
  Book.create(title:, description:, published:, rent:, return_date:)
end

reviews = [
  # title, content, rating, date, user_id, book_id
  ['good', 'good for me', 4, '2022-05-16', User.first.id, Book.first.id],
  ['excellent', 'excellent for me', 5, '2022-05-20', User.first.id, Book.second.id],
  ['so so', 'so so for me', 2, '2022-05-20', User.second.id, Book.first.id]
]

reviews.each do |title, content, rating, date, user_id, book_id|
  Review.create(title:, content:, rating:, date:, user_id:, book_id:)
end

categories = ['java', 'kotlin', 'jvm', 'server-side']

categories.each do |name|
  Category.create(name:)
end

books_categories = [
  # book_id, category_id
  [Book.first.id, Category.first.id],
  [Book.first.id, Category.third.id],
  [Book.first.id, Category.fourth.id],
  [Book.second.id, Category.fourth.id],
  [Book.third.id, Category.fourth.id],
]

books_categories.each do |book_id, category_id|
  BooksCategory.create(book_id:, category_id:)
end

rental_histories = [
  # start_date, return_date, user_id, book_id
  ['2022-05-20', '2022-05-27', User.first.id, Book.first.id],
  ['2022-05-29', '2022-05-31', User.first.id, Book.second.id],
  ['2022-05-20', '2022-05-31', User.second.id, Book.third.id]
]

rental_histories.each do |start_date, return_date, user_id, book_id|
  RentalHistory.create(start_date:, return_date:, user_id:, book_id:)
end

comments = [
  # title, content, favorite_count, date, edited, user_id, review_id
  ['sounds good', 'I' 'm just looking for java beginner book', 0, '2022-05-21', 0, User.second.id, Review.first.id],
  ['LGTM', 'this book has good reputation', 0, '2022-05-22', 0, User.second.id, Review.second.id],
  ['nice sharing', 'I' 've read same book. But your insights gives me new inspiration', 0, '2022-05-21', 0, User.first.id, Review.third.id],
]

comments.each do |title, content, favorite_count, date, edited, user_id, review_id|
  Comment.create(title:, content:, favorite_count:, date:, edited:, user_id:, review_id:)
end

# 10.times do
#   review = Review.all.sample,
#     Book.create!(
#       title: Faker::Lorem.word,
#       review: review,
#     )
# end
