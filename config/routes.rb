Rails.application.routes.draw do
  get 'menus/index'
  get 'menus/show'
  get 'menus/new'
  get 'menus/edit'
  resources :menu_categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
