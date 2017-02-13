Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # set home to the authentication page
  root 'dashboard#authenticate'

  get '/authenticate', to: 'dashboard#authenticate'

  # set form submit to login controller
  post '/', to: 'dashboard#login'
end
