Rails.application.routes.draw do

  passwordless_for :users

  resources :users, only: [:new, :create]

  get "static/members_only", to: "static#members_only"
  root "static#index"

end
