Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  post '/registrations', to: 'registrations#create'


  root to: "static#home"
  # root "articles#index"

end
