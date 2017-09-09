Rails.application.routes.draw do
 
  mount RuCaptcha::Engine => "/rucaptcha"
  root 'topics#index'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'

  resources :users
  resources :settings
  resources :topics
  resources :categories
  resources :tags
  resources :manages
  
end
