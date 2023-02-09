Rails.application.routes.draw do
  if Rails.env.development?
    root 'blogs#index'
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
