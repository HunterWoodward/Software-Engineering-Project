Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :users do
    resources :welcomes
  end
  get 'series/:id', to: 'series#show', as: 'series' #show
  get 'comics/:id', to: 'comics#show', as: 'comic' #show
  get 'comics/:id/pages/:page', to: 'pages#show', as: 'page' #show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
