Rails.application.routes.draw do
  get 'doctors/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]

  delete '/doctors/:id/patients/:patient_id/appointments', to: 'appointments#destroy'

  resources :patients, only: [:index]
end
