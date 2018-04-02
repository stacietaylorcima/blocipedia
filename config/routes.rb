Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'downgrade' => 'users#downgrade'
  end

  resources :wikis
  resources :charges

  get 'welcome/index'
  get 'welcome/about'
  get 'users/show'

  root 'welcome#index'
end
