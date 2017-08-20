Rails.application.routes.draw do
  root 'topics#index'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'

  resources :users
  resources :topics
  
end
