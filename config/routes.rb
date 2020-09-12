Rails.application.routes.draw do
  devise_for :users
  # , controllers: {
  #   sessions: 'users/sessions'
  # }

  root to: "products#index"
  resources :products, only: [:index, :new, :create]
end
