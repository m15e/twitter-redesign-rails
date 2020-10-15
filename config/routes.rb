Rails.application.routes.draw do
  resources :sources do
    resources :comments, only: [:create]
  end
  root 'sources#index'
  resources :sessions

  get 'login', :to => 'sessions#new', as: 'login'
  get 'logout', :to => 'sessions#destroy', as: 'logout'
  post 'sessions/try_login'    
  post 'followings/follow'
  delete 'followings/unfollow'  
  delete 'comments/destroy'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
