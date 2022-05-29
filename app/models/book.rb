class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :rental_histories, dependent: :destroy

  has_many :books_categories, dependent: :destroy
  has_many :categories, through: :books_categories

  TITLE_LENGTH_MAX = 300
  DESCRIPTION_LENGTH_MAX = 2000

  validates_with Validators::DateValidator, fields: %i[published_date return_date]

  validates :title, presence: true, length: { maximum: TITLE_LENGTH_MAX }, allow_blank: false
  validates :description, presence: true, length: { maximum: DESCRIPTION_LENGTH_MAX }, allow_blank: false
  validates :rent, inclusion: { in: [true, false] }

end
