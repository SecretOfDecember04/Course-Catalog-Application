Rails.application.routes.draw do
  get 'enrollments/index'
  get 'courses/reload', to: 'courses#reload'
  devise_for :users
  resources :users
  resources :availabilities
  resources :applications
  resources :recommendations
  resources :sections
  resources :courses
  resources :enrollments
  resources :admin
  authenticate :user do
    root to: 'courses#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
