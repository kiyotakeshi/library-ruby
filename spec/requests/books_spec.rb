# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "GET /books" do

    it "return books" do
      create_list(:book, 3)

      get "/books", as: :json
      expect(response).to have_http_status(:ok)
      books = JSON.parse(response.body)["books"]

      expect(books.size).to eq(3)

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

  describe "GET /books/:id" do

    let(:book) { create(:book) }

    it "return book" do
      get "/books/#{book.id}", as: :json
      expect(response).to have_http_status(:ok)
      book = JSON.parse(response.body)["books"]

      expect(book.key?("id")).to be true
      expect(book.key?("title")).to be true
      expect(book.key?("description")).to be true
      expect(book.key?("published_date")).to be true
      expect(book.key?("rent")).to be true
      expect(book.key?("return_date")).to be true
      expect(book.key?("categories")).to be true
    end
  end

  describe "GET /books/:id/reviews" do

    let(:book) { create(:book) }

    it "return book reviews" do
      create_list(:review, 3, book:)

      get "/books/#{book.id}/reviews", as: :json
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

  describe "POST /books" do
    let(:category) { create(:category, id: 10, name: "ruby") }
    let(:book_categories) { [{ category_id: category.id }] }

    context "created" do
      let(:params) { build(:book_with_categories_json, categories: book_categories) }

      it "create book" do
        post "/books", params: params, as: :json

        expect(response).to have_http_status(:created)
        book = JSON.parse(response.body)["books"]

        expect(book.key?("id")).to be true
        expect(book.key?("title")).to be true
        expect(book.key?("description")).to be true
        expect(book.key?("published_date")).to be true
        expect(book.key?("rent")).to be true
        expect(book.key?("return_date")).to be true
        expect(book.key?("categories")).to be true
        expect(book["categories"][0]["name"]).to eq("ruby")
      end
    end

    context "unprocessable_entity" do
      let(:params) { build(:book_with_categories_json, categories: book_categories, rent: "true") }

      it "validation error" do
        post "/books", params: params, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        # 文字列の "true" はエラー
        expect(JSON.parse(response.body)["rent"][0]).to eq("is not included in the list")
      end
    end
  end

  describe "POST /books/:id/reviews" do
    let(:book) { create(:book, id: 10) }
    let(:user) { create(:user, id: 5) }

    context "created" do
      let(:params) { build(:review_json, book_id: book.id, user_id: user.id) }

      it "create book review" do
        post "/books/:id/reviews", params: params, as: :json

        expect(response).to have_http_status(:created)
        review = JSON.parse(response.body)["reviews"]

        expect(review.key?("id")).to be true
        expect(review.key?("title")).to be true
        expect(review.key?("content")).to be true
        expect(review.key?("rating")).to be true
        expect(review.key?("date")).to be true
      end
    end

    context "unprocessable_entity" do
      let(:params) { build(:review_json, book_id: book.id, user_id: user.id, rating: 6) }

      it "validation error" do
        post "/books/:id/reviews", params: params, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)["rating"][0]).to eq("must be less than or equal to 5")
      end
    end
  end

  describe "DELETE /books/:id" do
    let(:book) { create(:book) }

    it "delete book and relationships" do
      create(:review, book:)
      create(:rental_history, book:)
      create(:books_category, book:)

      delete "/books/#{book.id}"

      expect(response).to have_http_status(:no_content)
      expect { Book.find(book.id) }.to raise_error(ActiveRecord::RecordNotFound)
      # 関連も削除されていること
      # expect { Review.where(book_id: book.id).take! }.to raise_error(ActiveRecord::RecordNotFound)
      expect(Review.exists?(book_id: book.id)).to be false
      expect(RentalHistory.exists?(book_id: book.id)).to be false
      expect(BooksCategory.exists?(book_id: book.id)).to be false
    end
  end
end
