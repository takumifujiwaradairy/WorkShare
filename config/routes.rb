Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  
  get '/' => 'hello#index'
  root 'hello#index'
  resources :tweets, only:[:index, :create]
end
