Rails.application.routes.draw do
	get '/', to: 'static_pages#home'
	get '/register', to: 'users#new'
  get '/login', to: 'login#login'
  post '/login_check', to: 'login#login_check'
  get '/logout', to: 'login#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
end