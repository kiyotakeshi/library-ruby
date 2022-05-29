class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show_books
    permitted = params.permit(:id)
    @category_books = Category.find(permitted[:id]).books
  end

  def create
    permitted_params = params.permit(:name)

    form = Form::CreateCategoryForm.new(permitted_params)
    return render json: form.errors, status: :unprocessable_entity unless form.valid?

    @category = form.to_model

    if @category.save
      render template: "categories/create", status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end

  end

  def destroy
    permitted = params.permit(:id)
    found = Category.find(permitted[:id])
    found.destroy!
  end
end
