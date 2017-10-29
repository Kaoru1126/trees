Rails.application.routes.draw do
  devise_for :users
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

end

