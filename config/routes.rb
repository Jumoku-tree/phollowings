Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  resources :works do
    resource :likes, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  resources :users, only: :show do
    member do
      get :likes
    end
  end
end