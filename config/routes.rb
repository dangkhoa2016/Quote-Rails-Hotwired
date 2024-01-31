Rails.application.routes.draw do
  resources :inventories

  root to: "pages#home"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    unlocks: "users/unlocks",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up', to: 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :quotes do
    resources :inventories, only: [:new, :create]
  end

  resource :profile, only: [:show, :edit, :update]

end
