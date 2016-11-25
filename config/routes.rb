Perfectcircle::Application.routes.draw do
  resources :photos
  resources :albums
  resources :shows
  resources :projects
  resources :pages
  resources :news

  get ":permalink" => "pages#show", as: :named

  devise_for :users

  root "news#index"
end
