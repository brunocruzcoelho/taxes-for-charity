Rails.application.routes.draw do
  root 'associations#index'

  resources :associations, only: :index

  namespace :admin do
    get '/', to: 'associations#index'
    post 'import', to: 'associations#import'
  end
end
