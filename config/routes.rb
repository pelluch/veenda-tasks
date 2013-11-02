VeendaTasks::Application.routes.draw do


  resources :issues
  resources :subtasks
  resources :task_subscriptions
  resources :estimates
  resources :task_types
  resources :project_memberships
  resources :veenda_tests
  resources :bugs
  resources :users
  resources :subtasks
  resources :comments
  resources :tasks
  resources :columns
  resources :workspaces
  resources :projects
  resources :sessions, only: [:new, :create, :destroy]

  match '/*path' => 'application#cors_preflight_check', :via => :options
  root to: 'tasks#index'

  match '/admins/panel', to: 'admins#panel'
  match '/admins/init_memberships', to: 'admins#init_memberships'
  match '/admins/init_task_types', to: 'admins#init_task_types'
  match '/admins/init_estimates', to: 'admins#init_estimates'
  match '/admins/init_columns', to: 'admins#init_columns'
  match '/admins/init_tasks', to: 'admins#init_tasks'
  match '/admins/init_task_subscriptions', to: 'admins#init_task_subscriptions'
  match '/admins/init_comments', to: 'admins#init_comments'
  match '/admins/init_subtasks', to: 'admins#init_comments'
  match '/admins/init_issues', to: 'admins#init_issues'


  #match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/home', to: 'static_pages#home'
  

  
  post '/updates' => 'updates#create'
  delete '/updates' => 'updates#destroy'
  put '/updates' => 'updates#update'

  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signup',  to: 'users#new'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
