ActionController::Routing::Routes.draw do |map|
  map.resources :photos

  map.root :controller => 'user_sessions', :action => 'new'

  map.resource :user_session
  map.resource :account, :controller => 'users'
  map.resources :users

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
