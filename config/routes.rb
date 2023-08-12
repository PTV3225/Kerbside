Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


#nesting chatrooms within posts so that a chatroom belongs to a single post
  resources :posts do
    resources :chatrooms
  end



end
