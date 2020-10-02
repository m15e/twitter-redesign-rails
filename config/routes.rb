Rails.application.routes.draw do
  root 'users#index'

  get 'login', :to => 'sessions#login'
  post 'sessions/try_login'  
  get 'sessions/login'
  get 'sessions/logout'
  post 'followings/follow'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
