Rails.application.routes.draw do
  resources :delivery_contents
  resources :media
  resources :groups
  resources :configurations
  resources :plans
  get 'welcome/index'

  devise_for :users

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  resources :leads

  root to: redirect('/users/sign_in')
end
