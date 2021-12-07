Rails.application.routes.draw do
  
  # post "/api/v1/courses/:id/like", to: "aaa#ccc"
  #要升級時，就可以不用動到原本的東西
  namespace :api do
    namespace :v1 do 
      resources :courses, only: [] do 
        member do 
          post :like
        end
      end
    end
    # namespace :v2 do 
    #   resources :courses
    # end
  end

  # resources :orders, only: [:index, :create] do
  #   member do 
  #     get :cancel
  #   end
  # end

  resources :courses do
    member do
      get :buy
    end
    resources :reviews, only: [:create]
    resources :orders, only: [:create]    #POST　/courses/2/orders 因為跟課程有關需要課程id
  end

  resources :reviews, only: [:destroy]
  # resources :orders, only: [:index]     # /orders

  root "courses#index"

  get "/about", to: "pages#about"

  # users function
  get "/sign_up", to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"

  get "/sign_in", to: "users#sign_in"
  post "/sign_in/check", to: "users#check"

  delete "/sign_out", to: "users#sign_out"
end

