# frozen_string_literal: true
module Form
  class UpdateUserForm

    include ActiveModel::Model

    attr_accessor :name, :email, :role_type, :joining_date

    EMAIL_LENGTH_MAX = 150
    NAME_LENGTH_MAX = 150
    # PASSWORD_LENGTH_MAX = 300

    validates_with Validators::DateValidator, fields: [:joining_date]

    validates :email, email: true
    validates :name, presence: true, length: { maximum: NAME_LENGTH_MAX }, allow_blank: false
    # validates :password, presence: true, length: { maximum: PASSWORD_LENGTH_MAX }, allow_blank: false
    validates :role_type, inclusion: { in: %w[admin user] }

    def initialize(params)
      @name = params[:name]
      @email = params[:email]
      @role_type = params[:role_type]
      @joining_date = params[:joining_date]
    end

    def to_hash
      h = {}
      h[:name] = name
      h[:email] = email
      h[:role_type] = role_type
      h[:joining_date] = joining_date
      h
    end
  end
end
