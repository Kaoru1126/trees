Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'products#top'

  resources :users
  # get 'strains' => 'strains#top'
  # get 'strains' => 'strains#search'

  resources :products, only: [:index, :show, :new, :search] do
    resources :reviews, only: [:new, :create]
      collection do
        get 'search'
        get 'review'
      end
  end

  resources :favproducts, only: [:index, :create, :destroy]
  resources :watchproducts, only: [:index, :create, :destroy]
  resources :likereviews, only: [:index, :create, :destroy]

  resources :users, only: [:index] do
    resources :favproducts, only: [:index, :create, :destroy]
    resources :watchproducts, only: [:index, :create, :destroy]
    resources :likereviews, only: [:index, :create, :destroy]
    resources :reviews, only: [:index]
  end

end

