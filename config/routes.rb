Rails.application.routes.draw do
  devise_for :users

  get 'strains' => 'strains#top'
  get 'strains' => 'strains#search'

  root 'strains#top'


end
