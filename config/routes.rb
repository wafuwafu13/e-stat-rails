# == Route Map
#
#                  Prefix Verb   URI Pattern                             Controller#Action
#            sessions_new GET    /sessions/new(.:format)                 sessions#new
#                    root GET    /                                       static_pages#home
#                    help GET    /help(.:format)                         static_pages#help
#                   about GET    /about(.:format)                        static_pages#about
#                 contact GET    /contact(.:format)                      static_pages#contact
#                  signup GET    /signup(.:format)                       users#new
#                   login GET    /login(.:format)                        sessions#new
#                         POST   /login(.:format)                        sessions#create
#                  logout DELETE /logout(.:format)                       sessions#destroy
#          following_user GET    /users/:id/following(.:format)          users#following
#          followers_user GET    /users/:id/followers(.:format)          users#followers
#                   users GET    /users(.:format)                        users#index
#                         POST   /users(.:format)                        users#create
#                new_user GET    /users/new(.:format)                    users#new
#               edit_user GET    /users/:id/edit(.:format)               users#edit
#                    user GET    /users/:id(.:format)                    users#show
#                         PATCH  /users/:id(.:format)                    users#update
#                         PUT    /users/:id(.:format)                    users#update
#                         DELETE /users/:id(.:format)                    users#destroy
#                         GET    /users(.:format)                        users#index
#                         POST   /users(.:format)                        users#create
#                         GET    /users/new(.:format)                    users#new
#                         GET    /users/:id/edit(.:format)               users#edit
#                         GET    /users/:id(.:format)                    users#show
#                         PATCH  /users/:id(.:format)                    users#update
#                         PUT    /users/:id(.:format)                    users#update
#                         DELETE /users/:id(.:format)                    users#destroy
# edit_account_activation GET    /account_activations/:id/edit(.:format) account_activations#edit
#        management_blogs GET    /blogs/management(.:format)             blogs#management
#                   blogs GET    /blogs(.:format)                        blogs#index
#                         POST   /blogs(.:format)                        blogs#create
#                new_blog GET    /blogs/new(.:format)                    blogs#new
#               edit_blog GET    /blogs/:id/edit(.:format)               blogs#edit
#                    blog GET    /blogs/:id(.:format)                    blogs#show
#                         PATCH  /blogs/:id(.:format)                    blogs#update
#                         PUT    /blogs/:id(.:format)                    blogs#update
#                         DELETE /blogs/:id(.:format)                    blogs#destroy
#           relationships POST   /relationships(.:format)                relationships#create
#            relationship DELETE /relationships/:id(.:format)            relationships#destroy

Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :blogs do
    collection do
      get :management
    end
  end
  resources :relationships, only: [:create, :destroy]
end
