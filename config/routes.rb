Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teachers do
    get 'logout', on: :member
    get 'admin/addcourse' => 'admin#add_course'

    resources :courses, only: [:new, :edit, :update, :destroy] do
      resources :books
      get 'submit', on: :member
    end
  end

  # set home to the authentication page
  root 'dashboard#authenticate'

  get '/index' => 'dashboard#index'
  get '/signup' => 'dashboard#signup'
  get '/admin/index' => 'admin#index'
  get '/admin/toggle' => 'admin#toggle'
  get '/index/sendEmail' => 'index#send_email'
  get '/course/:id' => 'courses#view'
  get '/admin/course/:id/finalize' => 'courses#finalize'
  delete '/admin/:teacher_id/course/:id' => 'courses#destroy'
  #get '/search' => 'courses#search'
  get '/search' => 'admin#search'
  # custom post for form (avoid collision of :teacher_id)
  post '/teachers/courses' => 'courses#create'
  post '/search' => 'courses#search'

  # set form submit to login controller
  post '/', to: 'dashboard#login'
end
