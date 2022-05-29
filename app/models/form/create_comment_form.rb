# frozen_string_literal: true

module Form
  class CreateCommentForm

    include ActiveModel::Model

    attr_accessor :user_id, :review_id, :content, :date

    CONTENT_LENGTH_MAX = 10_000

    validates_with Validators::DateValidator, fields: [:date]

    # form 作成前に book_id, user_id でDBにレコードが存在することを確認済みのため validation は不要
    validates :content, presence: true, length: { maximum: CONTENT_LENGTH_MAX }, allow_blank: false

    def initialize(params)
      @user_id = params[:user_id]
      @review_id = params[:review_id]
      @content = params[:content]
      @date = params[:date]
    end

    def to_model
      Comment.new(user_id:, review_id:, content:, date:)
    end
  end
end
