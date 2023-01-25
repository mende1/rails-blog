Rails.application.routes.draw do
  root 'pages#home'

  resources :articles do
    resources :comments
  end

  devise_for :users
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
end
