Rails.application.routes.draw do
  root "room#index"

  resources :rooms
end
