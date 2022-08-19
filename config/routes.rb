Rails.application.routes.draw do
  root "home#index"
  resources :psychology_tests, only: %i[index show]
  resources :answers, only: %i[create show]
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users, controllers: {
            registrations: "users/registrations",
          }
  resources :users, only: %i[show]
end
