Rails.application.routes.draw do
  resources :applications
  resources :recommendations
  resources :course_takens
  resources :sections
  resources :users
  resources :courses
end
