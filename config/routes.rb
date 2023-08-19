Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :posts do
    resources :treasures, only: [:new, :create, :edit, :update] do
      member do
        delete 'delete'
      end
    end
  end

  resources :chatrooms

  # Defines the root path route ("/")
  # root "articles#index"
end
