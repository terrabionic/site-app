Rails.application.routes.draw do

  resources :categories

  resources :surveys do
    resources :questions, except: :show
    resources :replies
  end

  get '/questions/:question_id/notes', to: 'notes#index', as: 'question_notes'
  post '/questions/:question_id/notes', to: 'notes#create'
  get '/questions/:question_id/notes/new', to: 'notes#new', as: 'new_question_note'
  get '/questions/:question_id/notes/:id/edit', to: 'notes#edit', as: 'edit_question_note'
  patch '/questions/:question_id/notes/:id', to: 'notes#update', as: 'question_note'
  delete '/questions/:question_id/notes/:id', to: 'notes#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'surveys#index'

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
