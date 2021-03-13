Rails.application.routes.draw do
  devise_for :users
  root to: "workschedules#index"
  get 'workschedules/index'
  resources :workschedules
  # , only: [:index] do
  #   collection do
  #       get :excel
  #   end
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
