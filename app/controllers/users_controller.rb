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
end
