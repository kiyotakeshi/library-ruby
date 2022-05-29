class ReviewsController < ApplicationController
  def destroy
    permitted = params.permit(:id)
    found = Review.find(permitted[:id])
    found.destroy!
  end

  def update
    permitted_params = params.permit(:title, :content, :rating, :date)
    @review = Review.find(params[:id])

    if @review.update(permitted_params)
      render template: "reviews/update", status: :ok
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def show_comments
    permitted = params.permit(:id)
    @review_comments = Review.find(permitted[:id]).comments
  end

  def create_comments
    permitted_params = params.permit(:user_id, :review_id, :content, :date)

    render json: "not found review", status: :not_found unless Review.exists?(permitted_params[:review_id])
    render json: "not found user", status: :not_found unless User.exists?(permitted_params[:user_id])

    @comment = Comment.new(permitted_params)

    if @comment.save
      render template: "reviews/create_comment", status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
end
