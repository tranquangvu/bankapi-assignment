Rails.application.routes.draw do
  root 'supports#home'

  namespace :api do
    namespace :v1 do
      namespace :customers do
        post :register, to: 'registrations#create'
        post :login, to: 'sessions#create'
        get :me, to: 'profiles#me'
      end
    end
  end
end
