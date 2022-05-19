class Review < ApplicationRecord
  has_many :comments, dependent: nil
  belongs_to :user
  belongs_to :book
end
