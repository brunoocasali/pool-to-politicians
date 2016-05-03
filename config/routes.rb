Rails.application.routes.draw do
  resources :leads
  devise_for :users
end
