Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :albums, :wishlist_albums

  get 'albums/search' => 'albums#search', :as => 'collection_search_page'
  get 'wishlist_albums/search' => 'wishlist_albums#search', :as => 'wishlist_search_page'

  post 'albums/new' => 'albums#new', :as => 'new_album_page'
  post 'wishlist_albums/new' => 'wishlist_albums#new', :as => 'new_wishlist_album_page'

  root 'welcome#index'

end
