Rails.application.routes.draw do
  devise_for :users
  resources :availabilities
  resources :applications
  resources :recommendations
  resources :course_takens
  resources :sections
  resources :users
  resources :courses
  authenticate :user do
    root to: 'courses#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
