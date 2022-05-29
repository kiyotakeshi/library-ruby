class CommentsController < ApplicationController
  def destroy
    permitted = params.permit(:id)
    found = Comment.find(permitted[:id])
    found.destroy!
  end

  def update
    permitted_params = params.permit(:content, :date, :edited)
    @comment = Comment.find(params[:id])

    if @comment.update(permitted_params)
      render template: "comments/update", status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
end
