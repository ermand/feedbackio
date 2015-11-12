Rails.application.routes.draw do
  root 'public/base#dashboard'

  scope module: :user do
    get 'dashboard' => 'base#dashboard', as: :dashboard
  end
end
