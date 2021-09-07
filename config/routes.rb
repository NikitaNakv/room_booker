Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  root "home#index"
  get 'reviews/index_with_create', to: "reviews#index_with_create"
  resources :rooms
  resources :reviews
  resources :bookings

end
