Rails.application.routes.draw do
  devise_for :users
  resources :availabilities
  resources :applications
  resources :recommendations
  resources :course_takens
  resources :sections
  resources :users
  resources :courses

  # root to: "home#index"
end
