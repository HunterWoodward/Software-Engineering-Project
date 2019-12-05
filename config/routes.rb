Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :welcomes
  end
  root 'welcome#index'
  get 'welcome/index', to: 'welcome#index', as:'welcome'
  get 'browse', to: 'static_pages#index', as:'browse' #Index browsing page
  post 'browse', to: 'static_pages#filter', as: 'filter' #Filter browsing page
  get 'mycomics', to: 'static_pages#show_my_comics', as: 'my_comics' # Show Creators comics
  get 'myreviews', to: 'static_pages#show_my_reviews', as: 'my_reviews' #Show 
  get 'critic/:id', to: 'static_pages#show_critic', as: 'critic' #Show critic page
  get 'creator/:id', to: 'static_pages#show_creator', as: 'creator' #Show creator page
  
  
  get 'series/new',to: 'series#new', as:'new_series'#New Series Page
  post 'series/new', to: 'series#create', as:'create_series'#Create Series
  get 'series/:id/edit', to: 'series#edit', as:'edit_series'#Edit Series Page
  patch 'series/:id', to: 'series#update' #Update Series Page
  put 'series/:id', to: 'series#update' #Replace Series Page
  get 'series/:id', to: 'series#show', as: 'series' #show
  get 'series/:id/reviews/new', to: 'reviews#new_series_review', as: 'new_series_review' #New form Review for series
  post 'series/:id/reviews', to:'reviews#create_series_review', as: 'create_series_review' #Create Review for Series
  post 'series/:id', to: 'discussion_posts#create_series_post', as: 'create_series_post' #Create Post

  get 'comics/new', to: 'comics#new', as: 'new_comic' #New Comic Page
  post 'comics/new', to: 'comics#create', as: 'create_comic' #Create Comic
  get 'comics/:id/edit', to: 'comics#edit' ,as: 'edit_comics'#edit
  get 'comics/:id/reviews/new', to: 'reviews#new_comic_review', as: 'new_comic_review' #New form Review for a comic
  post 'comics/:id/reviews', to: 'reviews#create_comic_review', as: 'create_comic_review' #Create Review for a comic
  patch 'comics/:id', to: 'comics#update' #update
  put 'comics/:id', to: 'comics#update' #replace
  get 'comics/:id', to: 'comics#show', as: 'comic' #show
  delete 'comics/:id/reccomend',to: 'static_pages#unreccomend', as: 'unreccomend' #Post to take off user Recc list.
  post 'comics/:id/reccomend', to: 'static_pages#reccomend', as: 'reccomend' #post to call Reccomend method of user
  post 'comics/:id', to: 'discussion_posts#create_comic_post', as: 'create_comic_post' #Create Post



  get 'reviews/new', to: 'reviews#new', as: 'new_review' #New Comic Page
  get 'reviews/:id', to: 'reviews#show', as: 'review' #Show review page
  post 'reviews/:id', to: 'discussion_posts#create_review_post', as: 'create_review_post' #Create Post

  get 'comics/:id/pages/:page', to: 'pages#show', as: 'page' #show

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
