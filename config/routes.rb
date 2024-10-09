Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :hospedes
  resources :funcionarios
  resources :reservas
  resources :quartos
  resources :users
  resources :checkins, only: [:new, :create]
  resources :checkouts, only: [:new, :create]
  resources :feedbacks, only: [:index, :show]
  resources :servicos, only: [:index, :update]
  get 'disponibilidade_quartos', to: 'quartos#disponibilidade'

end
