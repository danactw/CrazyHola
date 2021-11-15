Rails.application.routes.draw do
  get '/', to: "pages#index"
  # 等於 root "pages#index" 整個專案的跟目錄
  get '/about', to: "pages#about"
  get "/sign_up", to: "users#sign_up"
  get "/sign_in", to: "users#sign_in"
  post "/account_verify", to: "users#account_verify"
  post "/sign_in/check", to:"users#check"
end
