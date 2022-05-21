# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do

  describe "GET /users" do
    let!(:expected) { create_list(:user, 3) }

    it "return users data" do
      get "/users", as: :json
      expect(response).to have_http_status(:ok)
      users = JSON.parse(response.body)["users"]

      expect(users.size).to eq(3)

      first_user = users.first
      # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      expect(first_user.key?("id")).to be true
      expect(first_user.key?("name")).to be true
      expect(first_user.key?("email")).to be true
      expect(first_user.key?("role_type")).to be true
      expect(first_user.key?("joining_date")).to be true
    end
  end
end
