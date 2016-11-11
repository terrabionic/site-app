Rails.application.routes.draw do

  resources :contacts
  resources :companies
  resources :sectors
  resources :roles
  devise_for :users, controllers: { registrations: "registrations" }
  resources :categories

  resources :surveys do
    resources :questions, except: :show
    resources :replies, except: :destroy
  end

  resources :users, only: [:edit_user, :index, :new_user, :show, :update]


  get '/questions/:question_id/possible_answers', to: 'possible_answers#index', as: 'question_possible_answers'
  post '/questions/:question_id/possible_answers', to: 'possible_answers#create'
  get '/questions/:question_id/possible_answers/new', to: 'possible_answers#new', as: 'new_question_possible_answer'
  get '/questions/:question_id/possible_answers/:id/edit', to: 'possible_answers#edit', as: 'edit_question_possible_answer'
  patch '/questions/:question_id/possible_answers/:id', to: 'possible_answers#update', as: 'question_possible_answer'
  delete '/questions/:question_id/possible_answers/:id', to: 'possible_answers#destroy'
  post "/deactivate", to: "companies#deactivate"
  post "/action_activate", to: "companies#action_activate"
  post "/action_activate_deactivate", to: "sectors#action_activate_deactivate"

  # Crear usuario en base a una compañia creada
  post "/create_user", to: "companies#create_user"
  # Crear usuario desde un usuario logeado
  get '/users/new_user', to: 'users#new_user', as: 'new_user_admin'
  # Mostrar datos de los usuario
  get '/users/show/:id', to: 'users#show', as: 'show_user_admin'
  # Vista para cambiar el agente
  get '/companies/:id/asign_agent_company', to: 'companies#asign_agent_company', as: 'edit_asign_agent_company'
  # Vista 2 para cambiar el agente
  get '/asigns/asign_agent/:id', to: 'asigns#asign_agent', as: 'edit_asign_agent'
  # Asignamos encargado a la compañia
  post "/asignar", to: "asigns#action_asign"
  # Vista 3 para cambiar el agente
  get '/asigns/asign_emprered/:id', to: 'asigns#asign_emprered', as: 'edit_asign_emprered'
  # Asignar Emprered
  post "/asignar_emprered", to: "asigns#action_asign_emprered"
  # Editar usuario
  get '/users/:id/edit_user', to: 'users#edit_user', as: 'edit_user'
  # Editar usuario
  get '/users/:id/edit_role_u', to: 'users#edit_role_u', as: 'edit_role_u'
  # Mostrar datos de Generales de la Empresa
  get '/companies/show_general/:id', to: 'companies#show_general', as: 'show_general'
  # Accion para desactivar Usuario
  post "users/deactivate", to: "users#deactivate"
  # Accion para activar Usuario
  post "users/action_activate", to: "users#action_activate"
  # Pagina de inicio
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'
  # Pagina de inicio
  get '/about_us', to: 'home#about_us', as: 'about_us'
  get '/we_do', to: 'home#we_do', as: 'we_do'
 
  get '/privacy', to: 'home#privacy', as: 'privacy'

  # Editar permisos del role
  get '/role/:id/edit_permissions', to: 'roles#edit_permissions', as: 'edit_permissions'
  # Vista lista de usuarios por rol
  get '/user/index_role', to: 'users#index_role', as: 'index_role'
  # Dashboard de Emprered
  get '/companyroles/index_emprered', to: 'companyroles#index_emprered', as: 'index_emprered'
  # Editar Empresa Site
  # Editar permisos del role
  get '/companies/:id/edit_site', to: 'companies#edit_site', as: 'edit_site'

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
