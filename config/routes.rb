Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :welcomes
  end
  root 'welcome#index'
  get 'welcome/index', to: 'welcome#index', as:'welcome'
  get 'browse', to: 'static_pages#index', as:'browse' #Index browsing page
  post 'browse', to: 'static_pages#filter', as: 'filter' #Filter browsing page
  get 'series/:id', to: 'series#show', as: 'series' #show
  get 'comics/:id', to: 'comics#show', as: 'comic' #show
  get 'comics/:id/pages/:page', to: 'pages#show', as: 'page' #show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
