Rails.application.routes.draw do

resources :advertisements
resources :posts
  get 'advertisements/index'
  get 'advertisements/show'
  get 'advertisements/new'
  get 'advertisements/create'
  resources :advertisements
  resources :posts

  get 'about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  # gem "better_errors"
  # gem "binding_of_caller"

end
