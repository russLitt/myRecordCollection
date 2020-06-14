Rails.application.routes.draw do
  get 'welcome/index'
  get '/search' => 'albums#search', :as => 'search_page'

  resources :albums

  root 'welcome#index'
end
