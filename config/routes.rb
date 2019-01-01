Rails.application.routes.draw do
  devise_for module: :users, controllers: {
    sessions:      'users/sessions',
	  passwords:     'users/passwords',
    registrations: 'users/registrations',
    confirmation: 'users/confirmations',
  }
  root to: 'page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
