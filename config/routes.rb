Rails.application.routes.draw do
  root 'home#index'

  resources :charity_associations, only: [:index] do
    collection do
      get :search
    end
  end
end
