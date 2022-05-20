class ReviewsController < ApplicationController
  def show_comments
    permitted = params.permit(:id)
    @review_comments = Review.find(permitted[:id]).comments
  end
end
