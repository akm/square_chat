Rails.application.routes.draw do
  resources :organizations

  devise_for :users
  # root to: "devise/sessions#new" # Sign in
  root to: "organizations#index" # TODO Change top page


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
