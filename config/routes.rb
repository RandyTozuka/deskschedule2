Rails.application.routes.draw do
  devise_for :users
  root to: "workschedules#index"
  get 'workschedules/index'
  resources :workschedules
end
