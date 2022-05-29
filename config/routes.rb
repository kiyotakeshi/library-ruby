# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show create]
  get "/users/:id/reviews", to: "users#show_reviews"
  get "/users/:id/rental_histories", to: "users#show_rental_histories"
  post "/users/:id/rental_histories", to: "users#create_rental_histories"
  put "/users/:id", to: "users#update"

  resources :books, only: %i[index show create destroy]
  get "/books/:id/reviews", to: "books#show_reviews"
  post "/books/:id/reviews", to: "books#create_review"

  resources :categories, only: %i[index create destroy]
  get "/categories/:id/books", to: "categories#show_books"

  get "/reviews/:id/comments", to: "reviews#show_comments"
  post "/reviews/:id/comments", to: "reviews#create_comments"
  resources :reviews, only: %i[destroy]

  resources :comments, only: %i[destroy]
end
