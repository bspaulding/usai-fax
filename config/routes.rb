ActionController::Routing::Routes.draw do |map|
	map.resources :fax_documents
	map.resource :user_session
	map.root :controller => "fax_documents"
	map.connect '/fax_documents/make_public', :controller => 'fax_documents', :action => 'make_public'
	map.connect '/fax_documents/make_private', :controller => 'fax_documents', :action => 'make_private'
	map.connect '/fax_documents/update_faxes', :controller => 'fax_documents', :action => 'update_faxes'
	
	map.logout "logout", :controller => "user_sessions", :action => "destroy"
end