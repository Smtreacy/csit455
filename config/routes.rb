Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teachers do
    get 'logout', on: :member
    resources :courses do
      resources :books
    end
  end

  # set home to the authentication page
  root 'dashboard#authenticate'

  get '/index' => 'dashboard#index'
  get '/signup' => 'dashboard#signup'
  get '/adminindex' => 'dashboard#adminindex'

  # set form submit to login controller
  post '/', to: 'dashboard#login'
end
