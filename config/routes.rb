require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'public/base#dashboard'

  scope module: :user do
    # get 'dashboard' => 'base#dashboard', as: :dashboard
    resources 'companies'
    mount Sidekiq::Web, at: '/sidekiq'
    post "versions/:id/revert" => "versions#revert", as: "revert_version"
  end
end
