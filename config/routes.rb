Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  resources :works do
    resources :likes, only: [:create, :destroy]
    resources :references, only: :create
  end
  resources :users, only: :show do
    member do
      get :likes
    end
  end
end
