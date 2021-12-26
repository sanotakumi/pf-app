Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  resources :recipes do
    resource :favorites, only: [:create, :index, :destroy]
  end

  resources :menus, only:[:index, :create, :update, :destroy] do
    collection do
      delete "destroy_all"
    end
  end
    delete "menus/destroy_all" => "menus#destroy_all"

  resources :histories, only:[:index, :show]
  resources :ingredients, only:[:index]

  resources :users, only:[:show, :edit, :update]
  resources :recipe_ings, only:[:index, :create, :update, :destroy] do
    collection do
      delete "destroy_all"
    end
  end
    delete "recipe_ings/destroy_all" => "recipe_ings#destroy_all"

end