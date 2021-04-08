Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'dashboard#index'
    resources :orders
  end

  devise_for :users
end
