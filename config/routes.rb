Rails.application.routes.draw do
  resources :recruits
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  if Rails.env.development?
    root 'recruits#index'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
