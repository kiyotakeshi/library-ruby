# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show]
  get "/users/:id/reviews", to: "users#show_reviews"
  get "/users/:id/rental_histories", to: "users#show_rental_histories"

  resources :books, only: %i[index show]
  get "/books/:id/reviews", to: "books#show_reviews"

  resources :categories, only: :index
  get "/categories/:id/books", to: "categories#show_books"
end
