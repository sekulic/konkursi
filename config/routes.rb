Projekti::Application.routes.draw do
  scope "api" do
  resources :komentars
  end
  scope "api" do
  resources :pits
  end
  scope "api" do
  resources :korisnici
  end
  devise_for :users
  resources :raspisivacs

  resources :konkursi
  resources :pitanja  
  root to: "static_pages#home"
  get '/forum/' => "static_pages#pitanja"
  get "kontakt" => "static_pages#contact"  
  post 'search' => 'konkursi#search'
  get 'search' => 'konkursi#search'  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  get 'all_users' => 'korisnik#index'
  #get 'pitanja' => 'pitanja#index'
  match '/send_mail', to: 'static_pages#send_mail', via: 'post'
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
