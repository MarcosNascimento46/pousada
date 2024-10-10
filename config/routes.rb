Rails.application.routes.draw do
  get "reservas/index"
  get "reservas/show"
  get "reservas/new"
  get "reservas/edit"
  root to: "home#index"
  devise_for :users

  resources :hospedes do
    collection do
      get :search, to: 'hospedes#search'
    end
  end
  resources :funcionarios do
    collection do
      get :search, to: 'funcionarios#search'
    end
  end
  resources :reservas do
    collection do
      get :search, to: 'reservas#search'
    end
  end
  resources :quartos do
    collection do
      get :search, to: 'quartos#search'
    end
  end
  resources :users do
    collection do
      get :search, to: 'users#search'
    end
  end

  get 'disponibilidade_quartos', to: 'quartos#disponibilidade'

end
