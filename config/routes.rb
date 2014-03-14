Ironevents::Application.routes.draw do
  
  devise_for :users
  #Con get como lo tengo yo, lo que hace es por su posicion, marcar primero 
  #su ruta, porque si lo colocase debajo, iria a show ya que no generaria su propia
  #ruta search. Buscaria matchear otras antes.
  root :to => "events#index"
 get 'events/search' => 'search#autocomplete'
 #con collection lo que hago el lo mismo que con get, pero haciendolo asi
 #rails sabe que tiene que darle prioridad correcta a lo que le estamos estableciendo
 #member crear la url que le estamos pasando por medio de post o get, haria
 #/events/id/publish. Se ejecuta sobre uno de los elementos, con collection se haria sobre todos.
  resources :events #do
    #collection do
  #    get 'search'
    #end
  #end
  





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
