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

  def create
    book_permitted_params = params.permit(:title, :description, :published_date, :rent, :return_date)
    category_permitted_params = params.permit(categories: [:category_id])

    @book = Book.new(book_permitted_params)
    if @book.save
      @book.books_categories.create(category_permitted_params.to_hash["categories"])
      render template: "books/create", status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def show_reviews
    permitted = params.permit(:id)
    @book_reviews = Book.find(permitted[:id]).reviews
  end

  def create_review
    permitted_params = params.permit(:book_id, :user_id, :title, :content, :rating, :date)

    form = Form::CreateReviewForm.new(permitted_params)
    return render json: form.errors, status: :unprocessable_entity unless form.valid?

    @review = form.to_model

    if @review.save
      render template: "books/create_review", status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    permitted = params.permit(:id)
    found = Book.find(permitted[:id])
    found.destroy!
  end
end
