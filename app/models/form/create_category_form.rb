# frozen_string_literal: true

module Form
  class CreateCategoryForm

    include ActiveModel::Model

    attr_accessor :name

    NAME_LENGTH_MAX = 100

    validates :name, presence: true, length: { maximum: NAME_LENGTH_MAX }, allow_blank: false

    def initialize(params)
      @name = params[:name]
    end

    def to_model
      Category.new(name:)
    end
  end
end
