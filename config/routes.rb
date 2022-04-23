Rails.application.routes.draw do
  resources :customer_orders
  resources :menus
  get '/', to: redirect('/menus')
end
