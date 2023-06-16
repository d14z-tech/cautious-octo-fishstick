Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  defaults format: :json do
    root 'endpoints#welcome'
    get :health_check, to: 'endpoints#health_check'

    namespace :api do
      namespace :v1 do
        post :sign_up, to: 'users#create'
        post :sign_in, to: 'users#sign_in'
        resources :books do
          member do
            patch :mark_as_read
            patch :mark_as_unread
          end
        end
      end
    end
  end
end
