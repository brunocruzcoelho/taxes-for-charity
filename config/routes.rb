Rails.application.routes.draw do
  root 'associations#index'

  resources :associations, only: [:index] do
    collection do
      get :search
    end
  end

  namespace :admin do
    get '/', to: 'associations#index'
    post 'import', to: 'associations#import'
  end
end
