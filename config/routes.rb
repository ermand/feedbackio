Rails.application.routes.draw do
  devise_for :users
  root 'public/base#dashboard'

  scope module: :user do
    # get 'dashboard' => 'base#dashboard', as: :dashboard
    resources 'companies'
  end
end
