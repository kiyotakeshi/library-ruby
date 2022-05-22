# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do

    it "return categories" do
      create_list(:category, 3)

      get "/categories", as: :json
      expect(response).to have_http_status(:ok)
      categories = JSON.parse(response.body)["categories"]

      expect(categories.size).to eq(3)

      category = categories.first
      expect(category.key?("id")).to be true
      expect(category.key?("name")).to be true
    end
  end

  describe "GET /categories/:id/books" do

    let(:category) { create(:category) }
    let(:books) { create_list(:book, 2) }

    it "return category books" do
      create(:books_category, book: books.first, category:)
      create(:books_category, book: books.second, category:)

      get "/categories/#{category.id}/books", as: :json
      expect(response).to have_http_status(:ok)
      books = JSON.parse(response.body)["books"]

      expect(books.size).to eq(2)

      book = books.first
      expect(book.key?("id")).to be true
      expect(book.key?("title")).to be true
      expect(book.key?("description")).to be true
      expect(book.key?("published")).to be true
      expect(book.key?("rent")).to be true
      expect(book.key?("return_date")).to be true
      expect(book.key?("categories")).to be true
    end
  end
end
