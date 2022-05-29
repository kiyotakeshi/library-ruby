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
      expect(comment.key?("content")).to be true
      expect(comment.key?("favorite_count")).to be true
      expect(comment.key?("date")).to be true
      expect(comment.key?("edited")).to be true
      expect(comment["user_name"]).to eq("mike")
    end
  end

  describe "POST /reviews/:id/comments" do
    let(:reviewed_user) { create(:user, id: 10) }
    let(:commented_user) { create(:user, id: 11, name: "kendrick") }
    let(:review) { create(:review, id: 5, user: reviewed_user) }
    let(:params) { build(:review_comment_json, user_id: commented_user.id, review_id: review.id) }

    it "create review comment" do
      post "/reviews/:id/comments", params: params, as: :json

      expect(response).to have_http_status(:created)
      comment = JSON.parse(response.body)["comments"]

      expect(comment.key?("id")).to be true
      expect(comment.key?("user_name")).to be true
      expect(comment.key?("review_id")).to be true
      expect(comment.key?("content")).to be true
      expect(comment.key?("favorite_count")).to be true
      expect(comment.key?("date")).to be true
      expect(comment.key?("edited")).to be true
      expect(comment["user_name"]).to eq("kendrick")
    end
  end

  describe "DELETE /reviews/:id" do
    let(:review) { create(:review) }

    it "delete review and relationships are not deleted" do
      create(:comment, id: 10, review:)

      delete "/reviews/#{review.id}"

      expect(response).to have_http_status(:no_content)
      expect { Review.find(review.id) }.to raise_error(ActiveRecord::RecordNotFound)
      # 関連は削除されていないこと
      expect(Comment.exists?(review_id: review.id)).to be true
      expect(Comment.where(review: 1).first.id).to eq(10)
    end
  end
end
