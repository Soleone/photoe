ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'user_sessions', :action => 'new'

  map.resource :user_session
  map.resource :account, :controller => 'users'
  
  map.resources :users do |user|
    user.resources :photos,     :shallow => true
    user.resources :photobooks, :shallow => true
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
