Rails.application.routes.draw do
  root 'app#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  concern :rotable do
    resources :projects 
    resources :users, only: [:edit, :update, :show] do 
      member do 
        get 'profile'
        post 'update_password'
      end
    end
    resources :tags 

  end

  namespace :app do
    concerns :rotable
  end

end

