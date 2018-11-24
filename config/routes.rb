Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    # #34
    # resources :posts, except: [:index]

  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]

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
