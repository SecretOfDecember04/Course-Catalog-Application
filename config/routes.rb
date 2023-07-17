Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :availabilities
  resources :applications
  resources :recommendations
  resources :course_takens
  resources :sections
  resources :users
  resources :courses
end
