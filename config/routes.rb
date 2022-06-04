Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/search/players', to: 'searches#index'
  get '/player/show/:id', to: 'players#show'
  get 'parties/show/:id', to: 'parties#show'
  resources :users, only: [:create]
end
