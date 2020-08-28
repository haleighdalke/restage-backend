Rails.application.routes.draw do
  resources :festivals, only: [:index, :show, :new, :create]
  resources :pieces, only: [:index, :show, :new, :create, :edit, :update]
  resources :admins, only: [:show, :new, :create]
  resources :artists, only: [:index, :show, :new, :create, :edit, :update]
  resources :users

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
