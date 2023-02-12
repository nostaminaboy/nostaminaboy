Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  
  resources :relationships,       only: [:create, :destroy]
  resources :papers
  root 'papers#index'
end
