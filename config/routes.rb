Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  root "reserve#index"
  #
  get "index", to: "reserve#index", as: :index
  get "reserve/new", to: "reserve#new", as: :new
  post "reserve", to: "reserve#create", as: :reserve
end
