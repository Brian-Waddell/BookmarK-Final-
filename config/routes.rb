Rails.application.routes.draw do
  resources :follows
  resources :comments
  resources :books
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "books#index"
    root to: "home#index"
 #get("/users", {:controller => "books", :action => "index" })

  
end
