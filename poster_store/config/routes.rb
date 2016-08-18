Rails.application.routes.draw do

	devise_for :admins, :skip => [:sessions]

	as :admin do
    get 'admins/sign_in' => 'devise/sessions#new', :as => :new_admin_session
    post 'sessions/admin' => 'devise/sessions#create', :as => :admin_session
    delete 'admins/sign_out' => 'devise/sessions#destroy', :as => :destroy_admin_session
  end

  get 'meet/index'
  get 'learn/index'  
  resources :locations
  get 'locations/show'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'facebook/show'
  get 'about/index'
  get 'contact/index'
  get 'scraping/index'

  resources :orders
  resources :contact
  resources :line_items
  resources :carts
  get "home/index"
  get "store" => 'store#index'
  get "store/index"
  resources :posters
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]
  resource :facebook, only: [:show]
  root 'home#index'
  
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
