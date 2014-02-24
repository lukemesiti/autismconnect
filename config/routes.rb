Autismconnect::Application.routes.draw do
  resources :events

  devise_for :users
  root :to => "pages#home"

  get ':action' => 'pages#action'

end
