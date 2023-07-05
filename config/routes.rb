Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  post '/registrations', to: 'registrations#create'
  get '/registrations', to: 'registrations#index'
  delete '/logout', to: 'sessions#logout'
  get '/logged_in', to: 'sessions#logged_in'
  post '/login', to: 'sessions#login'




  root to: "static#home"
  # root "articles#index"

end
