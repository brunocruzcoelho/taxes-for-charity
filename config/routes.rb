Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'charity_associations#index'

  resources :charity_associations, only: [:index] do
    collection do
      get :search
    end
  end
end
