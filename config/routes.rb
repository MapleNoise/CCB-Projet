Rails.application.routes.draw do  

  devise_for :utilisateurs, skip: :all
  devise_scope :utilisateur do
    get 'connexion' => 'devise/sessions#new', as: :new_utilisateur_session
    post 'connexion' => 'devise/sessions#create', as: :utilisateur_session
    get 'deconnexion' => 'devise/sessions#destroy', as: :destroy_utilisateur_session
    # post   "utilisateurs/password"            => "devise/passwords#create", as: :utilisateur_password
    # get    "utilisateurs/password/new"        => "devise/passwords#new", as: :new_utilisateur_password
    # get    "utilisateurs/password/edit"       => "devise/passwords#edit", as: :edit_utilisateur_password
    # patch  "utilisateurs/password"            => "devise/passwords#update"
    # put    "utilisateurs/password"            => "devise/passwords#update"
    get    "inscription/cancel"  => "devise/registrations#cancel", as: :cancel_utilisateur_registration
    post   "inscription"         => "devise/registrations#create", as: :utilisateur_registration
    get    "inscription/enregistrement" => "devise/registrations#new", as: :new_utilisateur_registration
    get    "inscription/edit"    => "devise/registrations#edit", as: :edit_utilisateur_registration
    patch  "inscription"         => "devise/registrations#update"
    put    "inscription"         => "devise/registrations#update"
    delete "inscription"         => "devise/registrations#destroy"
    resources :categories

    resources :type_produits

    resources :fiche_produits

    resources :produits

  end
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :utilisateurs, :controller => "utilisateurs"
  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'test/style' => 'style#index'

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
