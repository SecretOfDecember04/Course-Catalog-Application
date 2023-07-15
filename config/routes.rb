Rails.application.routes.draw do
  resources :course_takens
  resources :sections
  resources :users
  resources :courses
end
