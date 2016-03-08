Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  resources :contact_forms
  resources :recipes

  get 'myrecipes' => 'recipes#index', :as => 'user_recipes'

  root to: 'pages#index'
end
