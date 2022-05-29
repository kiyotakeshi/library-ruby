class CommentsController < ApplicationController
  def destroy
    permitted = params.permit(:id)
    found = Comment.find(permitted[:id])
    found.destroy!
  end
end
