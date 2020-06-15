Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :albums, :wishlist_albums

  get '/search' => 'albums#search', :as => 'search_page'

  post 'albums/new' => 'albums#new', :as => 'new_album_page'

  root 'welcome#index'

end
