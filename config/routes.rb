Rails.application.routes.draw do
  resources :sources do
    resources :comments, only: [:create]
  end
  root 'sources#index'

  get 'login', :to => 'sessions#login'
  post 'sessions/try_login'  
  get 'sessions/login'
  get 'sessions/logout'
  post 'followings/follow'
  delete 'followings/unfollow'  
  delete 'comments/destroy'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
