Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :videos

  resources :posts do
    member do
      post 'favorite'
      delete 'unfavorite'
    end
    resources :chatrooms, only: :show do
      resources :messages, only: [:create, :destroy]
    end

    resources :treasures, only: [:new, :create, :edit, :update] do
      member do
        delete 'delete'
      end
    end
  end
end
