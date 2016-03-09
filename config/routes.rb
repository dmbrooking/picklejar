Rails.application.routes.draw do
  devise_for :users

  resources :contact_forms
  resources :recipes

  get 'myrecipes' => 'recipes#index', :as => 'user_recipes'

  root to: 'pages#index'
end
