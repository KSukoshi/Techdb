Rails.application.routes.draw do
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Spree::Core::Engine.add_routes do
  #public enquiries, e.g. that inherit Spree::StoreController
  get 'activity', :to => 'products#activity', :as => :list_activity_url
end

Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :list_activity_url
  end
end
end
