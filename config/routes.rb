Rails.application.routes.draw do
  get 'posts/new'
  get 'home/top'
  get "/" => "home#top"
  devise_for :users
  resources :users
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :posts do
    resources :reservations, only: [:new, :create, :show]
  end 
  resources :reservations, only: [:confirm]  do 
    collection do
      post 'confirm'
    end
  end
  get "reservations/index" => "reservations#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
