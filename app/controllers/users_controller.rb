# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    permitted = params.permit(:id)
    @user = User.find(permitted[:id])
  rescue ActiveRecord::RecordNotFound
    raise Errors::NotFoundError
  end

  def create
    permitted_params = params.require(:user)
                             .permit(:name, :email, :role_type, :joining_date)

    @user = User.new(permitted_params)

    if @user.save
      render template: "users/create", status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show_reviews
    permitted = params.permit(:id)
    @user_reviews = User.find(permitted[:id]).reviews
  end

  def show_rental_histories
    permitted = params.permit(:id)
    @user_rental_histories = User.find(permitted[:id]).rental_histories
  end
end
