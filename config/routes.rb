Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  if Rails.env.development?
    root 'blogs#index'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
