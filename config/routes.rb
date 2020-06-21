Rails.application.routes.draw do

  devise_for :users
  resources :albums, :wishlist_albums

  get 'welcome/index'
  get '/search' => 'albums#search', :as => 'search_page'
  get 'albums/:id/move' => 'albums#move', :as => 'move_album'
  get '/help' => 'welcome#help', :as => 'help_page'

  post 'albums/new' => 'albums#new', :as => 'new_album_page'
  post 'wishlist_albums/new' => 'wishlist_albums#new', :as => 'new_wishlist_album_page'
  post 'albums/:id/move' => 'albums#move', :as => 'move_album_page'

  root 'welcome#index'

end
