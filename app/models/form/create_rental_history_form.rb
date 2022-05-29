# frozen_string_literal: true

module Form
  class CreateRentalHistoryForm

    include ActiveModel::Model

    attr_accessor :user_id, :book_id, :start_date, :return_date

    validates_with Validators::DateValidator, fields: %i[start_date return_date]

    validates :user_id, numericality: { only_int: true, greater_than_or_equal_to: 1 }, allow_blank: false
    validates :book_id, numericality: { only_int: true, greater_than_or_equal_to: 1 }, allow_blank: false

    def initialize(params)
      @user_id = params[:user_id]
      @book_id = params[:book_id]
      @start_date = params[:start_date]
      @return_date = params[:return_date]
    end

    def to_model
      RentalHistory.new(user_id:, book_id:, start_date:, return_date:)
    end
  end
end
