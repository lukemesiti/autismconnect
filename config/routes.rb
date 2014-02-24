Autismconnect::Application.routes.draw do
  get "articles/index"
  get "articles/show"
  get "articles/create"
  get "articles/update"
  get "articles/destroy"
  resources :events

  devise_for :users
  root :to => "home#index"

end
