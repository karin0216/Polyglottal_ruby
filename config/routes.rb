Rails.application.routes.draw do
  resources :diaries
  get 'home/about'
  root 'diaries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
