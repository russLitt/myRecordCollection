Rails.application.routes.draw do
  get 'welcome/index'

  resource :albums

  root 'welcome#index'
end
