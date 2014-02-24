Autismconnect::Application.routes.draw do
  devise_for :users

  # SP 24/2/2homepage goes to views > pages > home.html.erb
  root :to => "pages#home"

  # SP 24/2/2014 whenever you go /<something> this will point you to pages > views > <something>.html.erb
  get ':action' => 'pages#action'

end
