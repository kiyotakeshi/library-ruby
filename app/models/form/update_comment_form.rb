# frozen_string_literal: true

module Form
  class UpdateCommentForm

    include ActiveModel::Model

    attr_accessor :content, :date, :edited

    CONTENT_LENGTH_MAX = 10_000

    validates_with Validators::DateValidator, fields: [:date]

    validates :content, presence: true, length: { maximum: CONTENT_LENGTH_MAX }, allow_blank: false
    validates :edited, inclusion: { in: [true, false] }

    def initialize(params)
      @content = params[:content]
      @date = params[:date]
      @edited = params[:edited]
    end

    def to_hash
      h = {}
      h[:content] = content
      h[:date] = date
      h[:edited] = edited
      h
    end
  end
end
