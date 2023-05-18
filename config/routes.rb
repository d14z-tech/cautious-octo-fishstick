Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  defaults format: :json do
    root 'endpoints#welcome'
    get :health_check, to: 'endpoints#health_check'
  end
end
