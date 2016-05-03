Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'leads#index', as: :authenticated_root
  end

  resources :leads

  root to: redirect('/users/sign_in')
end
