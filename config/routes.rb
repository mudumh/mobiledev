Rails.application.routes.draw do


  get 'comments/new'

  get 'comments/index'

  get 'comments/create'

  devise_for :users
  root to: "forum_threads#index"

  
  resources :review_requests do
    resources :review_responses
  end

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

  resources :forum_thread do
    member do
    put "like", to: "forum_threads#upvote"
    
    end
  end

  get 'review/:filter', to: 'review_requests#index', as: :request_filter
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
  resources :forum_threads do 
    resources :comments
  end
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
