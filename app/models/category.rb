class Category < ApplicationRecord
  has_many :books_categories, dependent: :destroy
  has_many :books, through: :books_categories

  NAME_LENGTH_MAX = 100

  validates :name, presence: true, length: { maximum: NAME_LENGTH_MAX }, allow_blank: false
end
