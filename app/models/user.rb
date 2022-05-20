class User < ApplicationRecord
  has_many :reviews, dependent: nil
  has_many :comments, dependent: nil
  has_many :rental_histories, dependent: :destroy
end
