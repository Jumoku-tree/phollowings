Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  resources :works do
    collection do
      get 'search'
    end
    resource :likes, only: [:create, :destroy]
    end
  resources :users, only: :show do
    member do
      get :likes
    end
  end
  resources :tags, only: :show
end