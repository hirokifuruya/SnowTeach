Rails.application.routes.draw do
  get 'welcome/index'

  resources :recruits
  resources :skiresorts
  resources :requests
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show]

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    root to: 'recruits#index'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  else
    root to: 'home#index'
  end
end

