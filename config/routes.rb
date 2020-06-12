Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :show] do 
    member do 
      get 'send_friend'
      patch 'update_friend'
      delete 'destroy_friend'
    end
  end

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
