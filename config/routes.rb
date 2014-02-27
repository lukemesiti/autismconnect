Autismconnect::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  mount Forem::Engine, :at => '/forums'


  resources :documents

  resources :events
  resources :links
  resources :articles

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks", registrations: "registrations" }
  resources :users, only: [:index, :show, :update]

  
  get '/profile' => 'users#show'
  get '/profile/edit' => 'users#edit'
  post '/profile' => 'users#update'
  get '/search' => 'search#index', :as => :search

  # SP 24/2/2homepage goes to views > pages > home.html.erb

  # SP homepage goes to views > pages > home.html.erb
  root :to => "pages#home"

  # SP whenever you go /<something> this will point you to pages > views > <something>.html.erb
  get '/:action' => 'pages#action'

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  #   get "sign_up", to: "devise/registrations#new"
  # end

end
