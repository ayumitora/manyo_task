Rails.application.routes.draw do
  namespace :admin do
    get 'users/show'
  end
  namespace :admin do
    resources :users
  end
  root to: 'tasks#index'
  resources :tasks
end
