Rails.application.routes.draw do

  resources :fonctions

  resources :statuses

  resources :extension_fichiers

  resources :reponses

  resources :questions

  resources :quizzs

  #resources :chapitres

  #resources :sections

  # Routes pour le workflow formations
  resources :formations do
    resources :sections do
      resources :chapitres
    end
  end

  get 'formations/:id/hierarchie' => 'formations#hierarchie', :as => :hierarchie


  resources :utilisateur2s

  resources :formats

  # Routes personnalisées à placer avant les routes par défaut
  delete "/produits/:id" => "produits#delete"

  # Routes des ressources

    resources :type_produits

    resources :fiche_produits

    resources :produits #, defaults: { format: 'html' }

    resources :tags

    root :to => "welcome#index", :action => '/'
    match "signup", :to => "utilisateur2s#new", via: [:get, :post]

    match "login", :to => "sessions#login", via: [:get, :post]
    get "loginAchat", :to => "sessions#login_achat"

    match "logout", :to => "sessions#logout", via: [:get, :post]
    match "home", :to => "sessions#home", via: [:get, :post]
    match "profile", :to => "sessions#profile", via: [:get, :post]
    match "setting", :to => "sessions#setting"    , via: [:get, :post]
    match 'connexion' => 'sessions#login_attempt', via: [:get, :post]
    match 'erreur' => 'errors#erreur', via: [:get, :post], as: :forbidden
    match "MapSite", :to => "utilisateur2s#MapSite", via: [:get, :post]
    match "afficherMonProfil", :to => "utilisateur2s#afficherMonProfil", via: [:get, :post]
    match "achat/:id", :to => "produits#achat", via: [:get, :post]


#  get 'login' => 'sessions#setting'



    resources :tags

  get 'listeProduit' => 'produits#listeProduit'
  get 'utilisateur2s/:id/modifierUtilisateur' => 'utilisateur2s#modifier_utilisateur'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # resources :utilisateurs, :controller => "utilisateurs"
  # You can have the root of your site routed with "root"
  #root 'welcome#index'

  get '/indexBack' => 'welcome#indexBack'

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
