Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'rooms#index'
  resources :rooms
  get '/rooms', to: 'rooms#index'
  get '/room/:id/operate', to: 'rooms#operate', as: 'operation_button'

end
