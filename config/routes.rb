Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'contacts#index'

  resources :contacts do
    get '/search', on: :collection, action: 'search'
    put '/photo', action: 'add_photo'
    resource :tags, only: :create
  end

end
