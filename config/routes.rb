Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'contacts#index'

  resources :contacts do
    post '/photo', action: 'photo', on: :member
    resource :tags, only: :create
  end

  get '/search', controller: 'contacts', action: 'search'
end
