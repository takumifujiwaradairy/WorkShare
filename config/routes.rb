Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'hello#index'
  root 'hello#index'
  resources :tweets, only:[:index, :create]
end
