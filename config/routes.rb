Rails.application.routes.draw do
  get 'home/index'
  get 'welcome/index'

  devise_for :users

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  resources :configurations
  resources :deliveries
  resources :delivery_contents
  resources :groups
  resources :leads
  resources :media, except: :show
  resources :plans

  root 'home#index' # to: redirect('/users/sign_in')
end
