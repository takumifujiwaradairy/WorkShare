Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  root 'hello#index'
  resources :hello, only: [:index]
  resources :users, only: [:show]
  resources :tweets, only: %i[index create show edit destroy update] do
    resources :likes, only: %i[create destroy]
  end
end
