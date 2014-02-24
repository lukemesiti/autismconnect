Autismconnect::Application.routes.draw do

  resources :events
  resources :links
  resources :articles

  devise_for :users
  root :to => "home#index"

end
