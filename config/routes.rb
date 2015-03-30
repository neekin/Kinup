Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#welcome'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # issues
 resources :issues
#test
  #comments
  post '/issues/:issue_id/comment' => 'comments#create'
  post '/comments/showcomments' =>'comments#showcomments'
  resources :comments,only:[:create]
  #user
  get 'signup' => 'users#signup' , :as =>'signup'
  get 'login'=> 'users#login', :as =>'login'
  post 'create_login_session' => 'users#create_login_session'
  get 'logout' =>'users#logout', :as =>'logout'
  resources :users,only:[:create]
  get 'info' =>'users#info'
  post 'headimg' => 'users#headimg'
  #photobook
  get 'photos' => 'photobook#showphotobooklist' ,:as=>'photos'
  post 'createphotobook' =>'photobook#createphotobook'
  get '/photos/:photobook_id'=>'photobook#showphotos'
  #photo
  post 'photos/uploadphoto' =>'photo#uploadphoto'
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
  #   resources :photobook, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
