Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create,:destroy]
 end

  resources :users, only: [:index,:show,:edit,:update]do
   resource :relationships, only: [:create, :destroy]
   get 'relationships/followings'
  get 'relationships/followers'
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end