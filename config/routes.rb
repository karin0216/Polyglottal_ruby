Rails.application.routes.draw do
  devise_for :users
  resources :diaries
  get 'home/about'
  root 'diaries#index'
end
