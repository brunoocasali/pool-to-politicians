Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users

  authenticated :user do
    root 'welcome#index', as: :authenticated_root
  end

  resources :leads

  root to: redirect('/users/sign_in')
end
