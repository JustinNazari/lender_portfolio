Rails.application.routes.draw do
  root "home#index"
  
  resources :users do
    resources :loans
  end
  get '/home/automatic_payments' => 'home#automatic_payments', as: 'automatic_payments'

 end
