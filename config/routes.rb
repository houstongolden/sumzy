Sumzy::Application.routes.draw do


  root 'welcome#index'
  get "/soundcloud_callback.html" => "welcome#soundcloud_callback"
  resources :sessions
  resources :users
  resources :profiles

  get '/feeds', to: 'feeds#index'

  match '/profiles/post_to_social_network', to: 'profiles#post_to_social_network', via: :post

  get '/pages/about', to: 'pages#about'
  get '/pages/help', to: 'pages#help'
  get '/pages/dashboard', to: 'pages#dashboard'
  get '/pages/settings', to: 'pages#settings'
  get '/pages/inbox', to: 'pages#inbox'
  get '/pages/search', to: 'pages#search'
  get '/pages/music', to: 'pages#music'
  get '/pages/photos', to: 'pages#photos'
  get '/pages/videos', to: 'pages#videos'
  get '/pages/post', to: 'pages#post'




  get 'users/:id', to: 'users#show'

  # OmniAuth Stuff
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


end
