Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'comics#index'

  get '/comics', to: 'comics#index'
  get '/comics/search', to: 'comics#search'
  get '/comics/search-favorites', to: 'comics#search_favorites'
  get '/comics/my-favorites', to: 'comics#my_favorites'
  post '/comics/add-to-favorites', to: 'comics#add_to_favorites'
  delete '/comics/remove-from-favorites', to: 'comics#remove_from_favorites'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
end
