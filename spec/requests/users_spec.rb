# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do

  describe "GET /users" do

    it "return users" do
      create_list(:user, 3)

      get "/users", as: :json
      expect(response).to have_http_status(:ok)
      users = JSON.parse(response.body)["users"]

      expect(users.size).to eq(3)

      user = users.first
      # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      expect(user.key?("id")).to be true
      expect(user.key?("name")).to be true
      expect(user.key?("email")).to be true
      expect(user.key?("role_type")).to be true
      expect(user.key?("joining_date")).to be true
    end
  end

  describe "GET /users/:id" do
    let(:user) { create(:user) }

    it "return user" do
      get "/users/#{user.id}", as: :json

      expect(response).to have_http_status(:ok)
      user = JSON.parse(response.body)["users"]

      expect(user.key?("id")).to be true
      expect(user.key?("name")).to be true
      expect(user.key?("email")).to be true
      expect(user.key?("role_type")).to be true
      expect(user.key?("joining_date")).to be true
    end
  end

  describe "GET /users/:id/reviews" do
    let(:user) { create(:user) }

    it "return user reviews" do
      create_list(:review, 3, user:)

      get "/users/#{user.id}/reviews", as: :json

      expect(response).to have_http_status(:ok)
      reviews = JSON.parse(response.body)["reviews"]

      expect(reviews.size).to eq(3)

      review = reviews.first
      expect(review.key?("id")).to be true
      expect(review.key?("title")).to be true
      expect(review.key?("content")).to be true
      expect(review.key?("rating")).to be true
      expect(review.key?("date")).to be true
    end
  end

  describe "GET /users/:id/rental_histories" do
    let(:user) { create(:user) }
    let(:book1) { create(:book, title: "ruby beginner") }
    let(:book2) { create(:book, title: "ruby professional") }

    it "return user rental histories" do
      create(:rental_history, user:, book: book1)
      create(:rental_history, user:, book: book2)

      get "/users/#{user.id}/rental_histories", as: :json

      expect(response).to have_http_status(:ok)
      rental_histories = JSON.parse(response.body)["rental_histories"]

      expect(rental_histories.size).to eq(2)

      first_rental_history = rental_histories.first
      expect(first_rental_history.key?("id")).to be true
      expect(first_rental_history.key?("user_id")).to be true
      expect(first_rental_history.key?("book_id")).to be true
      expect(first_rental_history.key?("start_date")).to be true
      expect(first_rental_history.key?("return_date")).to be true
      expect(first_rental_history.key?("book_title")).to be true
      expect(first_rental_history["book_title"]).to eq("ruby beginner")

      second_rental_history = rental_histories.second
      expect(second_rental_history["book_title"]).to eq("ruby professional")
    end
  end

  describe "POST /users/:id/rental_histories" do
    let(:user) { create(:user) }
    let(:book) { create(:book, title: "ruby professional") }
    let(:params) { build(:rental_history_json, user_id: user.id, book_id: book.id) }

    it "create rental history" do
      post "/users/#{user.id}/rental_histories", params: params, as: :json

      expect(response).to have_http_status(:created)
      rental_history = JSON.parse(response.body)["rental_histories"]

      expect(rental_history.key?("id")).to be true
      expect(rental_history.key?("user_id")).to be true
      expect(rental_history.key?("book_id")).to be true
      expect(rental_history.key?("start_date")).to be true
      expect(rental_history.key?("return_date")).to be true
      expect(rental_history.key?("book_title")).to be true
      expect(rental_history["book_title"]).to eq("ruby professional")
    end

    # TODO: 異常系のテスト
  end
end
