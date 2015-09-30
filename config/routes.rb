Rails.application.routes.draw do
  #oyster section
  mount WeixinRailsMiddleware::Engine, at: "/"

  resources :wechat_users, except: [:new, :create, :destroy] do
    collection do
      get 'success'
    end
  end

  namespace :system do
    resources :menus, only: [:create, :destroy]
  end

  namespace :wechat_service do 
    
  resources :car_owners, only: [:new, :create, :edit, :update] do
    collection do
      get 'success'
    end
  end

  resources :service_vendors, only: [:index, :show]

  resources :service_orders, only: [:index, :create] do 
    member do
      post 'cancel'
      post 'refuse'
      post 'confirm'
      post 'complete'
    end
  end
  end

  #mussel section
  get 'users/index'

  resources :service_orders

  resources :service_items, expect: [:show]

  resources :service_vendors, expect: [:new, :create]
  resources :car_owners

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do
    member do
      post 'approve'
    end
  end

  namespace :api, defaults: { format: 'json' } do
    resources :sessions, only: [:create] do
      collection do
        delete 'destroy'
        post 'refrush'
      end
    end
    resources :car_owners, only: [:create]
    resources :service_orders, only: [:index, :show, :create] do
      member do
        post 'cancel'
        post 'refuse'
        post 'confirm'
        post 'complete'
      end
    end
  end

  root 'home#dashboard'
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