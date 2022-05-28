class ReviewsController < ApplicationController
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
