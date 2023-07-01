Rails.application.routes.draw do
  resources :tuits
  #get "/inicio", to: "tuits#index"
  post "/crear", to: "tuits#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tuits#index"
end
