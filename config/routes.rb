Rails.application.routes.draw do
  root to: 'pages#home'

  resources :doctors do
    get 'appropriate-for/:ailment_id', action: :appropriate_for, on: :collection
  end
  resources :patients
  resources :appointments
end
