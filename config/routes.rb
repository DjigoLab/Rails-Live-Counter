Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :rooms
  get '/rooms', to: 'rooms#index'
  get '/about', to: 'about#index', as: 'about_path'
  get '/room/:id/sum', to: 'rooms#sum_counter', as: 'sum_button'
  get '/room/:id/sub', to: 'rooms#sub_counter', as: 'sub_button'

  resources :users
  get '/users/:id', to: 'rooms#index'

  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



end
