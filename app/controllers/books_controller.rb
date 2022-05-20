class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    permitted = params.permit(:id)
    @book = Book.find(permitted[:id])
  rescue ActiveRecord::RecordNotFound
    raise Errors::NotFoundError
  end

  def show_reviews
    permitted = params.permit(:id)
    @book_reviews = Book.find(permitted[:id]).reviews
  end
end
