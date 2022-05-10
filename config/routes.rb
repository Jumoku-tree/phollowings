Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  resources :works, only: [:index, :new, :create, :show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    resources :references, only: :create
  end
  resources :users, only: :show
end
