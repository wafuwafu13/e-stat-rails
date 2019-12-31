# == Route Map
#
#           Prefix Verb   URI Pattern                 Controller#Action
#             root GET    /                           static_pages#home
#             help GET    /help(.:format)             static_pages#help
#            about GET    /about(.:format)            static_pages#about
#          contact GET    /contact(.:format)          static_pages#contact
#           signup GET    /signup(.:format)           users#new
#            users GET    /users(.:format)            users#index
#                  POST   /users(.:format)            users#create
#         new_user GET    /users/new(.:format)        users#new
#        edit_user GET    /users/:id/edit(.:format)   users#edit
#             user GET    /users/:id(.:format)        users#show
#                  PATCH  /users/:id(.:format)        users#update
#                  PUT    /users/:id(.:format)        users#update
#                  DELETE /users/:id(.:format)        users#destroy
# management_blogs GET    /blogs/management(.:format) blogs#management
#      select_blog GET    /blogs/:id/select(.:format) blogs#select
#            blogs GET    /blogs(.:format)            blogs#index
#                  POST   /blogs(.:format)            blogs#create
#         new_blog GET    /blogs/new(.:format)        blogs#new
#        edit_blog GET    /blogs/:id/edit(.:format)   blogs#edit
#             blog GET    /blogs/:id(.:format)        blogs#show
#                  PATCH  /blogs/:id(.:format)        blogs#update
#                  PUT    /blogs/:id(.:format)        blogs#update
#                  DELETE /blogs/:id(.:format)        blogs#destroy
#         comments POST   /comments(.:format)         comments#create
#          comment DELETE /comments/:id(.:format)     comments#destroy

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new'
  resources :users
  resources :blogs do
    collection do
      get :management
    end
    member do
      get :select
    end
  end
  resources :comments, only: [:create, :destroy]
end
