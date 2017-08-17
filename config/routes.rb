Rails.application.routes.draw do
  root 'topics#index'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  resources :users
  resources :topics
  resources :sessions
end
