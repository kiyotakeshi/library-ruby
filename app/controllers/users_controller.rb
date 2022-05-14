class UsersController < ApplicationController
  def index
    users = User.all
    render status: 200, json: { users: users }
  end
end
