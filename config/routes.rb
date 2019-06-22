Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'home#index'
  get 'recipes/new' => 'api/v1/recipes#new'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :recipes
      resources :ingredients
    end
  end
end
