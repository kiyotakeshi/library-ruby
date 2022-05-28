class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show_books
    permitted = params.permit(:id)
    @category_books = Category.find(permitted[:id]).books
  end

  def create
    permitted_params = params.permit(:name)

    @category = Category.new(permitted_params)

    if @category.save
      render template: "categories/create", status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end

  end
end
