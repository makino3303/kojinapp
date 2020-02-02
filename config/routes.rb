Rails.application.routes.draw do

  devise_for :users
  root "ports#index"

  resources :ports do
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :works do
  end
end
