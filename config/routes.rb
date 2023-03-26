Rails.application.routes.draw do
  root 'app#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  concern :rotable do
    resources :projects 
  end

  namespace :app do
    concerns :rotable
  end

end

