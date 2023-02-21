Rails.application.routes.draw do
  root to: 'welcome#index'

  get 'welcome/index', as: 'welcome'

  resources :recruits
  resources :skiresorts
  resources :requests
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_session
    post 'sessions/guest_sign_in', to: 'users/sessions#new_guest'
    # post 'admin/guest_sign_in', to: 'users/sessions#admin_guest', as: :admin_guest_sign_in
    post 'sessions/admin_guest_sign_in', to: 'users/sessions#admin_guest', as: :admin_guest_sign_in
  end

  resources :users, only: [:show]

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end



