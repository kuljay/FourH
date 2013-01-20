CarrotBunnyMixedWithSn0wp3asLovedByMogetzNJ::Application.routes.draw do
 #get "static_pages/home"

  #get "static_pages/about"

  #get "static_pages/help"

  mount RedactorRails::Engine => '/redactor_rails'
  #Act as commentable resources
  #resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
  match '/about', to: 'static_pages#about'
  match '/help', to: 'static_pages#help'
  match '/home', to: 'static_pages#home'
  resources :categories


  resources :posts


  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"
  devise_for :users
  resources :users
end