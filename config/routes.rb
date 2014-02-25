Autismconnect::Application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'


  resources :documents

  resources :events
  resources :links
  resources :articles

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }


  # SP 24/2/2homepage goes to views > pages > home.html.erb
  root :to => "pages#home"

  # SP 24/2/2014 whenever you go /<something> this will point you to pages > views > <something>.html.erb
  get '/:action' => 'pages#action'

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  #   get "sign_up", to: "devise/registrations#new"
  # end

end
