class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  CONTENT_LENGTH_MAX = 10000

  validates_with Validators::DateValidator, fields: [:date]

  validates :content, presence: true, length: { maximum: CONTENT_LENGTH_MAX }, allow_blank: false

  # TODO: create,update 用のform objectを作成し、そこでvalidationする
  # validates :favorite_count, presence: true, numericality: { only_int: true, greater_than_or_equal_to: 0 },
  #                            allow_blank: false

  # TODO: boolean のvalidation
  # validates :edited
end
