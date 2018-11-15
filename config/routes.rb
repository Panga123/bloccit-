Rails.application.routes.draw do

  resources :topics do
# #34
   resources :posts, except: [:index]
 end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :questions
  resources :advertisements

  # resources :advertisements
 resources :posts

  get 'about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'



end
