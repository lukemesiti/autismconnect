Autismconnect::Application.routes.draw do
  get "links/index"
  get "links/show"
  get "links/create"
  get "links/update"
  get "links/destroy"
  resources :events

  devise_for :users
  root :to => "home#index"

end
