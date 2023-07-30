Rails.application.routes.draw do
  devise_for :users
  resources :availabilities
  resources :applications
  resources :recommendations
  resources :sections
  resources :courses
  resources :enrollments, only: [:create]
  authenticate :user do
    root to: 'courses#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
