Rails.application.routes.draw do
  root 'home#index'

  namespace :admin do
    root 'dashboard#index'
  end

  devise_for :users
end
