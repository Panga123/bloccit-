Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]


  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end

# adding route for show action
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirm' => 'users#confirm'

  resources :questions
  resources :advertisements

  # resources :advertisements
  resources :posts

  get 'about' => 'welcome#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'



end
