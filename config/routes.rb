Rails.application.routes.draw do
  resources :photos
  resources :albums
  resources :shows
  resources :projects
  resources :pages
  resources :news

  get ":permalink" => "pages#show", as: :named

  devise_for :users

  root "news#index"

  # For details on the DSL available within this file, see
  # http://guides.rubyonrails.org/routing.html
end
