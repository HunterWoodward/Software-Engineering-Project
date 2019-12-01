Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :welcomes
  end
  root 'welcome#index'
  get 'welcome/index', to: 'welcome#index', as:'welcome'
  get 'browse', to: 'static_pages#index', as:'browse' #Index browsing page
  post 'browse', to: 'static_pages#filter', as: 'filter' #Filter browsing page
  
  get 'series/new',to: 'series#new', as:'new_series'#New Series Page
  post 'series/new', to: 'series#create', as:'create_series'#Create Sereis
  get 'series/:id', to: 'series#show', as: 'series' #show
  post 'series/:id', to: 'discussion_posts#create_series_post', as: 'create_series_post' #Create Post

  get 'comics/new', to: 'comics#new', as: 'new_comic' #New Comic Page
  post 'comics/new', to: 'comics#create', as: 'create_comic' #Create Comic
  get 'comics/:id/edit', to: 'comics#edit' ,as: 'edit_comics'#edit
  patch 'comics/:id', to: 'comics#update' #update
  put 'comics/:id', to: 'comics#update' #replace
  get 'comics/:id', to: 'comics#show', as: 'comic' #show
  post 'comics/:id', to: 'discussion_posts#create_comic_post', as: 'create_comic_post' #Create Post

  get 'reviews/:id', to: 'reviews#show', as: 'review' #Show Review
  post 'reviews/:id', to: 'discussion_posts#create_review_post', as: 'create_review_post' #Create Post

  get 'comics/:id/pages/:page', to: 'pages#show', as: 'page' #show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
