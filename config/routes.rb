Rails.application.routes.draw do

  resources :pages, only: [:new, :edit, :create, :update]
  get '/pages/:slug' => 'pages#show'
  
  resources :pieces, only: [:index] 
  get 'pieces/voicings' => 'voicings#index'
  get 'pieces/voicings/:voicing' => 'voicings#show'
  get 'pieces/:slug' => 'pieces#show', as: 'piece'
  
  resources :composers, only: [:index]
  get 'composers/:name' => 'composers#show', as: 'composer'

  resources :manuscripts, only: [:index]
  get 'manuscripts/:slug' => 'manuscripts#show', as: 'manuscript'

  resources :books, only: [:index]
  get 'books/:slug' => 'books#show', as: 'book'

  get 'contact' => 'contact#new'
  post 'contact' => 'contact#create'

  get 'about' => 'static_pages#about'
  get 'publications' => 'static_pages#publications'

  resources :repositories, only: [:index]
  get 'repositories/:slug' => 'repositories#show', as: 'repository'

  resources :tags, only: [:index]
  get 'tags/:name' => 'tags#show', as: 'tag'

  namespace :tools do
    get 'metadata_generator' => 'metadata_generator#new'
    get 'cpdl' => 'cpdl#new'
  end
  
  resources :search, only: [:index, :create]
  namespace :api, defaults: { format: 'json' } do
    get 'pieces' => 'pieces#search'
    get 'dances' => 'dances#search'
  end 
  post '/dance_search' => 'home#search'
  
  get 'dance' => 'home#dance', as: 'dance_home'
  get 'dances/:slug' => 'dances#show', as: 'dance'
  resources :dances, only: [:index]

  get 'dance_sources' => 'dance_sources#index'
  get 'dance_sources/:slug' => 'dance_sources#show', as: 'dance_source'

  resources :ensembles, only: [:index]
  get 'ensembles/:slug' => 'ensembles#show', as: 'ensemble'

  resources :dance_categories, only: [:index]
  get 'dance_categories/:name' => 'dance_categories#show', as: 'dance_category'

  root 'home#show'
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
