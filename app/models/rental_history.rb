class RentalHistory < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_with Validators::DateValidator, fields: %i[start_date return_date]

  validates :user_id, numericality: { only_int: true, greater_than_or_equal_to: 0 }, allow_blank: false
  validates :book_id, numericality: { only_int: true, greater_than_or_equal_to: 0 }, allow_blank: false
end
