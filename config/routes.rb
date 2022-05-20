# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[index show]
  get "/users/:id/reviews", to: "users#show_reviews"

  resources :books, only: :index
  resources :categories, only: :index
end
