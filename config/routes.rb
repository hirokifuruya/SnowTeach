Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_session
    post 'sessions/guest_sign_in', to: 'users/sessions#new_guest'
    post 'sessions/admin_guest_sign_in', to: 'users/sessions#admin_guest', as: :admin_guest_sign_in
    get 'admin_guest_sign_in', to: 'users/sessions#admin_guest', as: :admin_guest_sign_in_path
  end

  authenticated :user do
    root to: 'users#my_page', as: :authenticated_root
  end

  unauthenticated do
    root to: 'welcome#index'
  end

  resources :recruits
  resources :skiresorts
  resources :requests
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users, only: [:show]
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end




