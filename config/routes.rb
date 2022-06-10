Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'
  # post '/auth/twitter/callback', to: 'sessions#create'
  post '/parties/:id/players', to: 'parties#update'
  post '/auth/twitter', as: :twitter_login
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/search/players', to: 'searches#index'
  get '/players/:id', to: 'players#show'
  get 'parties/:id', to: 'parties#show'
  get '/party', to: 'parties#show'
  # resources :users, only: [:create] do
  #   resources :parties, only:[:show, :update, :destroy] do
  #     resources :players, only:[:show]
  #   end
  # end
end
