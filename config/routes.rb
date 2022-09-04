Rails.application.routes.draw do
  get 'posts/new'
  get 'home/top'
  get "/" => "home#top"
  devise_for :users
  resources :users
  resources :posts
  resources :posts do
    resources :reservations
  end 
  post 'reservations/confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
