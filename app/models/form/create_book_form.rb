# frozen_string_literal: true

module Form
  class CreateBookForm

    include ActiveModel::Model

    attr_accessor :title, :description, :published_date, :rent, :return_date

    TITLE_LENGTH_MAX = 300
    DESCRIPTION_LENGTH_MAX = 2000

    validates_with Validators::DateValidator, fields: %i[return_date], if: -> { return_date.present? }
    validates_with Validators::DateValidator, fields: %i[published_date]

    validates :title, presence: true, length: { maximum: TITLE_LENGTH_MAX }, allow_blank: false
    validates :description, presence: true, length: { maximum: DESCRIPTION_LENGTH_MAX }, allow_blank: false
    validates :rent, inclusion: { in: [true, false] }

    def initialize(params)
      @title = params[:title]
      @description = params[:description]
      @published_date = params[:published_date]
      @rent = params[:rent]
      @return_date = params[:return_date]
    end

    def to_model
      Review.new(title:, description:, published_date:, rent:, return_date:)
    end
  end
end
