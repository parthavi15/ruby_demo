Rails.application.routes.draw do
  root to: redirect('/admin')

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :v1 do
    resources :exercises
  end
end
