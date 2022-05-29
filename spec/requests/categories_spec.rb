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
      expect(book.key?("published_date")).to be true
      expect(book.key?("rent")).to be true
      expect(book.key?("return_date")).to be true
      expect(book.key?("categories")).to be true
    end
  end

  describe "POST /categories" do

    context "created" do
      let(:params) { build(:category_json, name: "ruby on rails") }

      it "create category" do
        post "/categories", params: params, as: :json

        expect(response).to have_http_status(:created)
        category = JSON.parse(response.body)["categories"]

        expect(category.key?("id")).to be true
        expect(category.key?("name")).to be true
        expect(category["name"]).to eq("ruby on rails")
      end
    end

    context "unprocessable_entity" do
      let(:params) { build(:category_json, name: "") }

      it "validation error" do
        post "/categories", params: params, as: :json

        expect(response).to have_http_status(:unprocessable_entity)

        json = JSON.parse(response.body)
        expect(json["name"][0]).to eq("can't be blank")
        expect(json["name"][1]).to eq("is too short (minimum is 1 character)")
      end
    end

  end

  describe "DELETE /categories/:id" do
    let(:category) { create(:category) }

    it "delete category" do
      delete "/categories/#{category.id}"

      expect(response).to have_http_status(:no_content)
      expect { Category.find(category.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
