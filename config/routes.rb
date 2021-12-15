# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {  omniauth_callbacks: "omniauth_callbacks" }
  root 'hello#index'
  resources :hello, only: [:index]
  resources :users, only: [:show]
  resources :tweets, only: %i[index create show edit destroy update] do
    resources :likes, only: %i[create destroy]
    resources :comments, only: [:create]
  end
  post '/callback' => 'linebot#callback'
end
