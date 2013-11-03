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
  
end
