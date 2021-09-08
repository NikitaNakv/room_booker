Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  root "home#index"
  get 'reviews/index_with_create', to: "reviews#index_with_create"
  get 'reviews/index', to: "reviews#index"
  patch 'reviews/:id/accept', to: "reviews#accept"
  get 'rooms/:id/book', to: "bookings#new"
  get 'bookings/index', to: "bookings#index"
  patch 'bookings/:id/accept', to: "bookings#accept"
  resources :rooms
  resources :reviews
  resources :bookings

end
