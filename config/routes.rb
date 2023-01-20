Rails.application.routes.draw do
  root 'pages#home'

  resources :articles do
    resources :comments
  end

  resources :users
  get 'signup', to: 'users#new'
end
