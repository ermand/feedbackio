require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post "versions/:id/revert" => "versions#revert", as: "revert_version"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'public/base#dashboard'
  get 'google_api' => 'public/base#google_api'

  scope module: :users do
    get "dashboard" => "base#dashboard", as: "dashboard"
    resources 'companies'
    resources 'tasks'
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
