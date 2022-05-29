# frozen_string_literal: true

module Form
  class CreateReviewForm

    include ActiveModel::Model

    attr_accessor :book_id, :user_id, :title, :content, :rating, :date

    TITLE_LENGTH_MAX = 150
    CONTENT_LENGTH_MAX = 10_000

    validates_with Validators::DateValidator, fields: [:date]

    # form 作成前に book_id, user_id でDBにレコードが存在することを確認済みのため validation は不要
    # validates :book_id, numericality: { only_int: true, greater_than_or_equal_to: 1 }, allow_blank: false
    # validates :user_id, numericality: { only_int: true, greater_than_or_equal_to: 1 }, allow_blank: false
    validates :title, presence: true, length: { maximum: TITLE_LENGTH_MAX }, allow_blank: false
    validates :content, presence: true, length: { maximum: CONTENT_LENGTH_MAX }, allow_blank: false
    validates :rating, presence: true,
                       numericality: { only_int: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

    def initialize(params)
      @book_id = params[:book_id]
      @user_id = params[:user_id]
      @title = params[:title]
      @content = params[:content]
      @rating = params[:rating]
      @date = params[:date]
    end

    def to_model
      Review.new(book_id:, user_id:, title:, content:, rating:, date:)
    end
  end
end
