Rails.application.routes.draw do
  get 'collaborators/new'

  devise_for :users
  devise_scope :user do
    get 'downgrade' => 'users#downgrade'
  end
  resources :charges, only: [:new, :create]
  resources :charges
  resources :collaborators, only: [:create, :destroy]
  resources :wikis
  resources :wikis, only: [] do
   resources :collaborators, only: [:create, :destroy]
 end

  get 'welcome/index'
  get 'welcome/about'
  get 'users/show'

  root 'welcome#index'
end
