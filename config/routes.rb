Rails.application.routes.draw do
  resources :addresses
  resources :users
  get 'form', to: 'formreciver#new'
  post 'create', to: 'formreciver#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
