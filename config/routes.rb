Rails.application.routes.draw do
  resources :menus
  get '/', to: redirect('/menus')
end
