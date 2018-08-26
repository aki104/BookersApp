Rails.application.routes.draw do
  devise_for :users
  
  root 'users#index'
  get '/top' => 'users#top'


 
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index, :create, :new, :destroy]
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
