# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Comments", type: :request do
  describe "DELETE /comments/:id" do
    let(:comment) { create(:comment) }

    it "delete comment" do
      delete "/comments/#{comment.id}"

      expect(response).to have_http_status(:no_content)
      expect { Comment.find(comment.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "PUT /comments/:id" do
    let(:comment) { create(:comment) }
    let(:params) do
      build(:comment_update_json, content: "update", date: "2022-05-29")
    end

    it "update comment" do
      put "/comments/#{comment.id}", params: params, as: :json

      expect(response).to have_http_status(:ok)
      comment = JSON.parse(response.body)["comments"]

      expect(comment.key?("id")).to be true
      expect(comment.key?("user_name")).to be true
      expect(comment.key?("review_id")).to be true
      expect(comment.key?("content")).to be true
      expect(comment.key?("favorite_count")).to be true
      expect(comment.key?("date")).to be true
      expect(comment.key?("edited")).to be true
      expect(comment["content"]).to eq("update")
      expect(comment["date"]).to eq("2022-05-29")
      expect(comment["edited"]).to eq(true)
    end
  end
end
