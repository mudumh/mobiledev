Rails.application.routes.draw do


  resources :collections do
      resources :collection_items, only: [:create,:index]
  end

  resources :submissions

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root to: "news_items#index"

  
  resources :news_items, only:[:index,:show,:create,:new]
  resources :tutorials, only:[:index,:show,:create,:new]
  resources :tools, only:[:index,:show,:create,:new]
  
  resources :news_items do
    member do
    put "like", to: "news_items#upvote"
    
    end
  end

  resources :tutorials do
    member do
    put "like", to: "tutorials#upvote"
    
    end
  end

  resources :tools do
    member do
    put "like", to: "tools#upvote"
    
    end
  end

  
  resources :users, only: [:show,:index]

  resources :news_items do 
    resources :comments
  end
  resources :tools do 
    resources :comments
  end

  resources :tutorials do 
    resources :comments
  end

end
