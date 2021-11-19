Rails.application.routes.draw do
  resources :courses
  get '/', to: "pages#index"
  get '/about', to: "pages#about"
  get "/sign_up", to: "users#sign_up"
  get "/sign_in", to: "users#sign_in"
  post "/account_verify", to: "users#account_verify"
  post "/sign_in/check", to:"users#check"
end
