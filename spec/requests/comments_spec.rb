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
end
