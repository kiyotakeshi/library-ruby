class User < ApplicationRecord
  has_many :reviews, dependent: nil
  has_many :comments, dependent: nil
  has_many :rental_histories, dependent: :destroy

  # validation で記載しているのでなくても良い
  # enum role_type: { admin: "admin", user: "user" }

  EMAIL_LENGTH_MAX = 150
  NAME_LENGTH_MAX = 150
  # PASSWORD_LENGTH_MAX = 300

  validates_with Validators::DateValidator, fields: [:joining_date]

  validates :email, email: true
  validates :name, presence: true, length: { maximum: NAME_LENGTH_MAX }, allow_blank: false
  # validates :password, presence: true, length: { maximum: PASSWORD_LENGTH_MAX }, allow_blank: false
  validates :role_type, inclusion: { in: %w[admin user] }

end
