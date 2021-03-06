Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get    "contacts/index",          to: "contacts#index", as: 'contacts'
  # get "contacts/new", to: "contacts#new", as: 'new_contact'
  # post "contacts/create", to: "contacts#create", as: 'create_contact'
  # get "contacts/:id/edit", to: "contacts#edit", as: 'edit_contact'
  # patch "contacts/:id/update", to: "contacts#update", as: 'update_contact'
  # delete "contacts/:id/destroy", to: "contacts#destroy", as: 'destroy_contact'
  resources :contacts, except: [:show] do
    get 'autocomplete', on: :collection
  end
  post '/groups', to: 'groups#create'
  root 'contacts#index'
end
