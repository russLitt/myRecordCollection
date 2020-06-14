Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :albums
  get '/search' => 'albums#search', :as => 'search_page'

  root 'welcome#index'

end
