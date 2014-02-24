Autismconnect::Application.routes.draw do
  devise_for :users

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_scope :user do
  #   get "sign_in", to: "devise/sessions#new"
  #   get "sign_up", to: "devise/registrations#new"
  # end



  root :to => "home#index"

end
