Rails.application.routes.draw do
  get 'home/index'
  get 'welcome/index'

  devise_for :users

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  resources :leads
  resources :delivery_contents
  resources :media
  resources :groups
  resources :configurations
  resources :plans

  root 'home#index' # to: redirect('/users/sign_in')
end
