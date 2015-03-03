Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'charity_associations#index'

  resources :charity_associations, only: [:index] do
    collection do
      get :search
    end
  end

  namespace :admin do
    get '/', to: 'charity_associations#index'
    post 'import', to: 'charity_associations#import'
    post 'import_new', to: 'charity_associations#import_new'
  end
end
