Rails.application.routes.draw do
  devise_for :users
  root to: 'page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :profiles, only: [:index, :create, :update]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
