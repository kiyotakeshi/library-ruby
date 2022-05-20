class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show_books
    permitted = params.permit(:id)
    @category_books = Category.find(permitted[:id]).books
  end
end
