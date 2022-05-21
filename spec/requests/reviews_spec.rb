# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Reviews", type: :request do
  describe "GET /reviews/:id/comments" do

    let(:review) { create(:review) }
    let(:user) { create(:user, name: "mike") }

    it "return review comments" do
      create_list(:comment, 2, review:, user:)

      get "/reviews/#{review.id}/comments", as: :json
      expect(response).to have_http_status(:ok)
      comments = JSON.parse(response.body)["comments"]

      expect(comments.size).to eq(2)

      comment = comments.first
      expect(comment.key?("id")).to be true
      expect(comment.key?("user_name")).to be true
      expect(comment.key?("review_id")).to be true
      expect(comment.key?("title")).to be true
      expect(comment.key?("content")).to be true
      expect(comment.key?("favorite_count")).to be true
      expect(comment.key?("date")).to be true
      expect(comment.key?("edited")).to be true
      expect(comment["user_name"]).to eq("mike")
    end
  end
end
