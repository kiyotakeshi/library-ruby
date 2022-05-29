class CommentsController < ApplicationController
  def destroy
    permitted = params.permit(:id)
    found = Comment.find(permitted[:id])
    found.destroy!
  end

  def update
    permitted_params = params.permit(:content, :date, :edited)
    form = Form::UpdateCommentForm.new(permitted_params)
    return render json: form.errors, status: :unprocessable_entity unless form.valid?

    @comment = Comment.find(params[:id])

    if @comment.update(form.to_hash)
      render template: "comments/update", status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
end
