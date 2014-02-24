Autismconnect::Application.routes.draw do

  resources :events
  resources :links
  resources :articles

  devise_for :users


  # SP 24/2/2homepage goes to views > pages > home.html.erb
  root :to => "pages#home"

  # SP 24/2/2014 whenever you go /<something> this will point you to pages > views > <something>.html.erb
  get ':action' => 'pages#action'

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  #   get "sign_up", to: "devise/registrations#new"
  # end

end
