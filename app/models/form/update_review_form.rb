# frozen_string_literal: true
module Form
  class UpdateReviewForm

    include ActiveModel::Model

    attr_accessor :title, :content, :rating, :date

    TITLE_LENGTH_MAX = 150
    CONTENT_LENGTH_MAX = 10_000

    validates_with Validators::DateValidator, fields: [:date]

    validates :title, presence: true, length: { maximum: TITLE_LENGTH_MAX }, allow_blank: false
    validates :content, presence: true, length: { maximum: CONTENT_LENGTH_MAX }, allow_blank: false
    validates :rating, presence: true,
                       numericality: { only_int: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

    def initialize(params)
      @title = params[:title]
      @content = params[:content]
      @rating = params[:rating]
      @date = params[:date]
    end

    def to_hash
      h = {}
      h[:title] = title
      h[:content] = content
      h[:rating] = rating
      h[:date] = date
      h
    end
  end
end
