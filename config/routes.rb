Rails.application.routes.draw do

  get 'category' => 'view_front#recipe_by_category'

  get 'users' => 'view_front#recipe_by_user'

  resources :categories
  devise_for :users
  resources :recipes

  root "recipes#index"
end
