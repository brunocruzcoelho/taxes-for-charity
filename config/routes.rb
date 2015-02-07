Rails.application.routes.draw do


  namespace :admin do
    get '/', to: 'associations#index'
    post 'import', to: 'associations#import'
  end
end
