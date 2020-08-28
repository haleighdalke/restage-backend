Rails.application.routes.draw do
  resources :festivals
  resources :pieces
  resources :admins
  resources :artists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
