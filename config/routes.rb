Spree::Core::Engine.routes.append do
  get '/invoices/:id(/:template)', :to => 'invoices#show', :as => :invoice
end
