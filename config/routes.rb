Rails.application.routes.draw do

  resources :sandboxes
  resources :widgets
  root 'sandboxes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
