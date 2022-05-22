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
    json = params.to_json
    # form = Form::Users::Create::UserForm.new(doc.data)

    user = User.new(email: 'mike@example.com', name: 'mike', password: '1qazxsw2', role_type: 'admin', joining_date: '2022-05-16')

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
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
