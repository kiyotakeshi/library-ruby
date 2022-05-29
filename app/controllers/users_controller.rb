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

  def create_rental_histories
    permitted_params = params.permit(:user_id, :book_id, :start_date, :return_date)

    @rental_history = RentalHistory.new(permitted_params)

    if @rental_history.save
      render template: "users/create_rental_histories", status: :created
    else
      render json: @rental_history.errors, status: :unprocessable_entity
    end
  end

  def update
    permitted_params = params.permit(:name, :email, :role_type, :joining_date)
    @user = User.find(params[:id])

    if @user.update(permitted_params)
      render template: "users/update", status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
