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

  def create_review
    permitted_params = params.permit(:book_id, :user_id, :title, :content, :rating, :date)
    @review = Review.new(permitted_params)

    if @review.save
      render template: "books/create_review", status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end
end
