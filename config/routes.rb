Rails.application.routes.draw do
  devise_for :users

  resources  :follows
  resources  :comments
  resources  :books
  resources  :dashboard 
  
  root to: "dashboard#index"
end
