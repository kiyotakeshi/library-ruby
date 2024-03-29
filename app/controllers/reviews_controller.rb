class ReviewsController < ApplicationController
  def destroy
    permitted = params.permit(:id)
    found = Review.find(permitted[:id])
    found.destroy!
  end

  def update
    permitted_params = params.permit(:title, :content, :rating, :date)

    form = Form::UpdateReviewForm.new(permitted_params)
    return render json: form.errors, status: :unprocessable_entity unless form.valid?

    @review = Review.find(params[:id])

    if @review.update(form.to_hash)
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

    form = Form::CreateCommentForm.new(permitted_params)
    return render json: form.errors, status: :unprocessable_entity unless form.valid?

    @comment = form.to_model

    if @comment.save
      render template: "reviews/create_comment", status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
end
