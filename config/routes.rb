Rails.application.routes.draw do
  root 'pages#home'

  resources :articles do
    resources :comments
  end
end
