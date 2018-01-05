Rails.application.routes.draw do

  mount RuCaptcha::Engine => "/rucaptcha"
  root 'topics#index'
  get '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  delete '/logout',to:'sessions#destroy'

  resources :users do
    collection do 
      get :verify_rucaptcha
    end
  end
  resources :settings
  resources :topics ,except:[:show] do
    collection do 
      get :all_index
      get :search
      post :search
      get :search_topics
      post :search_topics
    end
  end
  get "topics/:id",to:"topics#show",constraints:{id:/\d+/}
  get "likes/like_or_dont_like",to:"likes#like_or_dont_like"
  resources :categories
  resources :tags
  resources :manages
  resources :friend_links
  resources :comments
  resources :admins
  resources :limits
  resources :notices do
    collection do
      get :new_to

    end
  end
  end
