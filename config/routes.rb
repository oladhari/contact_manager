Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get    "contacts/index",          to: "contacts#index", as: 'contacts'
  get "contacts/new", to: "contacts#new", as: 'new_contact'
  # resources :contacts, only: [ :index ]
end
