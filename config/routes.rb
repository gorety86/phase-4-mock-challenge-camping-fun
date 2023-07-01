Rails.application.routes.draw do
  resources :campers, only: [:index, :show, :create]
  resources :signups, only: [:create]
  resources :activities, only:[:index, :destroy]
  get '/campers/:id', to: 'campers#show'
  delete '/activities/:id', to: 'activities#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
