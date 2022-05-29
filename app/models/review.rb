class Review < ApplicationRecord
  has_many :comments, dependent: nil
  belongs_to :user
  belongs_to :book

  TITLE_LENGTH_MAX = 150
  CONTENT_LENGTH_MAX = 10_000

  validates_with Validators::DateValidator, fields: [:date]

  validates :title, presence: true, length: { maximum: TITLE_LENGTH_MAX }, allow_blank: false
  validates :content, presence: true, length: { maximum: CONTENT_LENGTH_MAX }, allow_blank: false
  validates :rating, presence: true,
                     numericality: { only_int: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 },
                     allow_blank: false
end
