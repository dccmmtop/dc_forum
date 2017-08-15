Rails.application.routes.draw do
  root 'topics#index'
  resources :users
  resources :topics
end
