Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :hospedes
  resources :funcionarios
  resources :reservas
  resources :quartos
  resources :users

end
