Sumzy::Application.routes.draw do


  root 'welcome#index'
  resources :sessions
  resources :users
  resources :profiles

  get '/pages/about', to: 'pages#about'
  get '/pages/help', to: 'pages#help'
  get '/pages/dashboard', to: 'pages#dashboard'
  get '/pages/settings', to: 'pages#settings'
  get '/pages/inbox', to: 'pages#inbox'



  get 'users/:id', to: 'users#show'

  # OmniAuth Stuff
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


end
