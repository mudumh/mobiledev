Rails.application.routes.draw do



  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root to: "forum_threads#index"

  
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

  resources :forum_threads do
    member do
    put "like", to: "forum_threads#upvote"
    end
  end

  get 'review/:filter', to: 'review_requests#index', as: :request_filter
  resources :users, only: [:show,:index]

  

  
  
  
 
end
