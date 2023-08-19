Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :posts do
    resources :treasures, only: [:new, :create, :edit, :update] do
      member do
        delete 'delete'
      end
      resources :chatrooms, only: :show do
        resources :messages, only: [:create, :destroy]
      end
    end
  end
end
