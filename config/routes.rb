Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :albums, :wishlist_albums

  get '/search' => 'albums#search', :as => 'search_page'

  post 'albums/new' => 'albums#new', :as => 'new_album_page'
  post 'wishlist_albums/new' => 'wishlist_albums#new', :as => 'new_wishlist_album_page'

  root 'welcome#index'

end
