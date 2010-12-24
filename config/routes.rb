ActionController::Routing::Routes.draw do |map|
   map.resources :installations do |installation|
      installation.neighborhood '/neighborhood', :controller => 'installations', :action => 'neighborhood'
   end
  
   map.places '/installation', :controller => 'installations', :action => 'show'

  map.resources :things do |thing|
     thing.add_photos '/add_photos', :controller => 'things', :action => 'add_photos'
  end

  map.resources :reviews

  map.resources :neighborhood_notes

  map.resources :notes

  map.resources :ends
  map.resources :starts

  
  map.resources :communities

  map.off_post_housing '/off_post_housing', :controller => 'posts', :action => 'off_post_housing'
  map.add_photos '/add_photos', :controller => 'things', :action => 'add_photos'
  map.new_neighborhood '/new_neighborhood', :controller => 'neighborhoods', :action => 'new_neighborhood' 
  map.resources :posts, :member => { :off_post_housing => :any }
  map.connect "logged_exceptions/:action/:id", :controller => "logged_exceptions"
  map.resources :orders
  map.resources :spouses
  map.resources :addresses
  map.resources :events
  map.calendar 'moves/:move/calendar/:year/:month', :controller => 'calendar', :action => 'index', :year => Time.zone.now.year, :month => Time.zone.now.month
  map.resources :apartments
  map.resources :cons
  map.resources :pros
  map.resources :pets
  map.resource :account, :controller => "users"
  
  map.resources :notes
  map.resources :neighborhoods do |neighborhood|
     neighborhood.resources :reviews
  end
  map.resources :schools
  map.resources :homes
  map.resources :researches
  map.resources :trips
  map.resources :tour

  map.resources :itineraries do |itinerary|
    itinerary.resources :trips
  end

  map.resources :tasks

  map.resources :lists

  map.resources :families

  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route

  
  map.resources :users do |user|
    user.resources :moves
    user.resources :families
    user.resources :pets
    user.resources :things
  end
  
  map.resources :moves do |move|
    move.resources :researches
    move.resources :lists
    move.resources :schools
    move.resources :neighborhoods do |neighborhood|
       neighborhood.resources :communities
       neighborhood.resources :neighborhood_notes
    end
    move.resources :homes
    move.resources :notes
    move.resources :events
    move.resources :communities
    move.resources :itineraries do |itinerary|
      itinerary.resources :trips
    end
  end
  
  map.resources :researches do |research|
    research.resources :neighborhoods
    research.resources :homes
    research.resources :schools
  end
  
  map.connect '/add_new_neighborhood', :controller => "installations", :action => "index"
  #map.goto_installations '/installations', :controller => 'installations', :action => 'show', :id => 'page_id_or_permalink'
  
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
