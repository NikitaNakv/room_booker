Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  root "rooms#index"

  resources :rooms
  resources :reviews
end
