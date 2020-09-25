Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resources :publishes, only: :create
    resources :comments, except: [:index, :show]
  end

  resources :comments, only: [] do
    resources :reactions, only: [:create, :update, :destroy]
  end
  resources :my_posts, only: :index
end
