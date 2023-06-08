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
        patch '/books/:id/mark_as_read', to: 'books#mark_as_read'
        resources :books
      end
    end
  end
end
