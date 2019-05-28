Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/show'
  # get 'tasks/edit'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
