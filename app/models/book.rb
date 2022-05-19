class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :rental_histories, dependent: :destroy

  has_many :books_categories, dependent: :destroy
  has_many :categories, through: :books_categories
end
