Rails.application.routes.draw do
  root "home#index"
  get "home/top", to: "home#top"
  resources :psychology_tests, only: %i[index show]
  resources :answers, only: %i[create show]
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                       sessions: "users/sessions",
                     }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    post "users/guest_admin_sign_in", to: "users/sessions#guest_admin_sign_in"
  end
  resources :users, only: %i[show]
  resources :favorites, only: %i[create destroy]
end
