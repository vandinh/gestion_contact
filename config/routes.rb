Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts
  post '/contacts/:id/photo', to: 'contacts#add_photo'
  post '/contacts/:id/tags', to: 'contacts#add_tags'
  post '/contacts/search', to: 'contacts#search'
end
