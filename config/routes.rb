Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'logga-in', sign_out: 'logga-ut'}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  # Static pages

  get 'om',                to: 'pages#about',            as: 'about_page'
  get 'speglarna',         to: 'pages#about_mirrors',    as: 'about_mirrors_page'
  get 'relationsexpert',   to: 'pages#psychologist',     as: 'psychologist_page'
  get 'alla-bekannelser',  to: 'pages#all_confessions',  as: 'all_confessions_page'

  get '/psykolog', to: redirect('/relationsexpert')

  # Resources

  resources :confessions, path: 'bekannelser'
  resources :mirrors, only: [:show, :update]

  get '/google659702c6cbecf183.html',
    to: proc { |env| [200, {}, ["google-site-verification: google659702c6cbecf183.html"]] }

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
