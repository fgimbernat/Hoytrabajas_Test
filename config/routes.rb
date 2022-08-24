Rails.application.routes.draw do
  resources :suppliers
  get 'main/home'

  root "main#home"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
